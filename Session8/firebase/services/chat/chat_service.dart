import 'package:firebase_project/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) {
            final user = doc.data();
            return user;
          })
          .where((user) => user["uuid"] != _auth.currentUser!.uid)
          .toList();
    });
  }

  //get all users except blocked users
  Stream<List<Map<String, dynamic>>> getUsersStreamExcludingBlocked() {
    final currentUser = _auth.currentUser;
    return _firestore
        .collection("Users")
        .doc(currentUser!.uid)
        .collection("BlockedUsers")
        .snapshots()
        .asyncMap((snapshot) async {
      final blockedUserIds = snapshot.docs.map((doc) => doc.id).toList();
      final userDocsCollection = await _firestore.collection("Users").get();
      return userDocsCollection.docs
          .where((doc) =>
              doc.id != currentUser.uid && !blockedUserIds.contains(doc.id))
          .map((doc) => doc.data())
          .toList();
    });
  }

  Stream<QuerySnapshot> getMessages(String personOneId, personTwoId) {
    final List<String> listOfIds = [personOneId, personTwoId]..sort();
    final String chatRoomId = listOfIds.join("_");
    _firestore.collection("ChatRooms").doc(chatRoomId).set({"read": true});
    return _firestore
        .collection("ChatRooms")
        .doc(chatRoomId)
        .collection("Messages")
        .orderBy("timestamp", descending: true)
        .snapshots();
  }

  Future<void> sendMessage(
      String text, String receiverId, String receiverName) async {
    final currentUserId = _auth.currentUser!.uid;
    final timestamp = Timestamp.now();
    final List<String> listOfIds = [receiverId, currentUserId]..sort();
    final String chatRoomId = listOfIds.join("_");

    final newMessage = Message(
        message: text,
        receiverId: receiverId,
        senderId: currentUserId,
        timestamp: timestamp);

    _firestore.collection("ChatRooms").doc(chatRoomId).set({"read": false});

    await _firestore
        .collection("ChatRooms")
        .doc(chatRoomId)
        .collection("Messages")
        .add(newMessage.toMap());
  }

  //Report User
  Future<void> reportUser(
      {required String messageId, required String userId}) async {
    final currentUser = _auth.currentUser;
    final report = {
      'reportedBy': currentUser!.uid,
      'messageReported': messageId,
      'reportedUser': userId,
      'timestamp': FieldValue.serverTimestamp()
    };
    await _firestore
        .collection("Reports")
        .doc(userId)
        .collection("UserReports")
        .add(report);
  }

  //Bock User
  Future<void> blockUser({required String userId}) async {
    final currentUser = _auth.currentUser;
    await _firestore
        .collection("Users")
        .doc(currentUser!.uid)
        .collection("BlockedUsers")
        .doc(userId)
        .set({});
  }

  //Unblock User
  Future<void> unblockUser({required String userId}) async {
    final currentUser = _auth.currentUser;
    await _firestore
        .collection("Users")
        .doc(currentUser!.uid)
        .collection("BlockedUsers")
        .doc(userId)
        .delete();
  }

  //Get blocked users stream
  Stream<List<Map<String, dynamic>>> getBlockedUsersStream() {
    final currentUser = _auth.currentUser;
    return _firestore
        .collection("Users")
        .doc(currentUser!.uid)
        .collection("BlockedUsers")
        .snapshots()
        .asyncMap((snapshot) async {
      final blockedUserIds = snapshot.docs.map((doc) => doc.id).toList();
      final blockedUserDocs = await Future.wait(blockedUserIds
          .map((id) => _firestore.collection("Users").doc(id).get())
          .toList());
      return blockedUserDocs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
  }

  Future<bool> deleteAccount(BuildContext context) async {
    final currentUserId = _auth.currentUser!.uid;
    WriteBatch batch = _firestore.batch();

    //Delete Reports
    final reportCollection = await _firestore
        .collection("Reports")
        .doc(currentUserId)
        .collection("UserReports")
        .get();
    final currentUserDoc = _firestore.collection("Users").doc(currentUserId);
    for (final reportDoc in reportCollection.docs) {
      batch.delete(reportDoc.reference);
    }

    //Delete Chat rooms associated with the current user
    final chatRoomsCollection = await _firestore.collection("ChatRooms").get();
    for (final doc in chatRoomsCollection.docs) {
      final chatRoomId = doc.id;
      final userIds = chatRoomId.split("_");
      if (userIds.contains(currentUserId)) {
        //delete messages inside the chat room
        final messagesCollection = doc.reference.collection("Messages");
        final messages = await messagesCollection.get();
        for (final messageDoc in messages.docs) {
          batch.delete(messageDoc.reference);
        }
        //delete chatroom
        batch.delete(doc.reference);
      }
    }

    //delete user from blocked users collection of every user
    final usersCollection = await _firestore.collection("Users").get();
    for (final userDoc in usersCollection.docs) {
      final blockedUsers =
          await userDoc.reference.collection("BlockedUsers").get();
      for (final blockedUser in blockedUsers.docs) {
        if (blockedUser.id == currentUserId) {
          batch.delete(blockedUser.reference);
          break;
        }
      }
    }

    //delete user from users collection
    batch.delete(currentUserDoc);

    try {
      await batch.commit();
      await _auth.currentUser!.delete();
      return true;
    } catch (e) {
      debugPrint("user could not be deleted");
      return false;
    }
  }
}
