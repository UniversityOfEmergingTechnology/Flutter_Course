import 'package:firebase_project/models/chat_screen_arguments.dart';
import 'package:firebase_project/services/authentication/auth_service.dart';
import 'package:firebase_project/services/chat/chat_service.dart';
import 'package:firebase_project/widgets/user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/text_bubble.dart';

final _chatService = ChatService();
final _authService = AuthenticationService();

Widget UserList() {
  return StreamBuilder(
      stream: _chatService.getUsersStreamExcludingBlocked(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("error");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!
              .map<Widget>(
                (userData) => UserCard(
                  title: userData["name"].toString(),
                  email: userData["email"].toString(),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/chatscreen',
                      arguments: ScreenArguments(
                        name: userData['name'],
                        uid: userData['uuid'],
                      ),
                    );
                  },
                ),
              )
              .toList(),
        );
      });
}

Widget BlockedUsersList() {
  return StreamBuilder(
      stream: _chatService.getBlockedUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("error");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!
              .map<Widget>(
                (userData) => UserCard(
                  title: userData["name"].toString(),
                  email: userData["email"].toString(),
                  onTap: () {
                    _unblockUser(context: context, userId: userData["uuid"]);
                  },
                ),
              )
              .toList(),
        );
      });
}

Widget MessagesList({required String personOneId}) {
  return StreamBuilder(
      stream:
          _chatService.getMessages(personOneId, _authService.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('Loading');
        }

        return ListView(
          reverse: true,
          children: snapshot.data!.docs.map((messageDoc) {
            final message = messageDoc.data() as Map<String, dynamic>;
            final isSentByUser =
                message["senderId"] == _authService.currentUser!.uid;
            return GestureDetector(
              onLongPress: () {
                if (!isSentByUser) {
                  _showOptions(
                      context: context,
                      messageId: messageDoc.id,
                      userId: message["senderId"]);
                }
              },
              child: TextBubble(
                text: message["message"],
                isSentByUser: isSentByUser,
              ),
            );
          }).toList(),
        );
      });
}

Future<void> sendMessage(
    {required String text,
    required String receiverId,
    required String receiverName}) async {
  if (text.isNotEmpty) {
    await _chatService.sendMessage(text, receiverId, receiverName);
  }
}

void _reportMessage(
    {required BuildContext context,
    required String messageId,
    required String userId}) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('report message'),
            content: Text("just to confirm you want to report the message"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("cancel"),
              ),
              TextButton(
                onPressed: () {
                  _chatService.reportUser(messageId: messageId, userId: userId);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("message reported"),
                    ),
                  );
                },
                child: Text("report"),
              )
            ],
          ));
}

void _blockUser({required BuildContext context, required String userId}) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('block user'),
            content: Text("just to confirm you want to block the user"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("cancel"),
              ),
              TextButton(
                onPressed: () {
                  _chatService.blockUser(userId: userId);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("user blocked"),
                    ),
                  );
                },
                child: Text("block"),
              )
            ],
          ));
}

void _unblockUser({required BuildContext context, required String userId}) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('unblock user'),
            content: Text("just to confirm you want to unblock the user"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("cancel"),
              ),
              TextButton(
                onPressed: () {
                  _chatService.unblockUser(userId: userId);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("user unblocked"),
                    ),
                  );
                },
                child: Text("unblock"),
              )
            ],
          ));
}

void _showOptions(
    {required BuildContext context,
    required String userId,
    required String messageId}) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.flag),
                title: Text('report'),
                onTap: () {
                  Navigator.pop(context);
                  _reportMessage(
                      context: context, messageId: messageId, userId: userId);
                },
              ),
              ListTile(
                leading: Icon(Icons.block),
                title: Text('block'),
                onTap: () {
                  Navigator.pop(context);
                  _blockUser(context: context, userId: userId);
                },
              ),
              ListTile(
                leading: Icon(Icons.cancel),
                title: Text('cancel'),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      });
}

Future<void> deleteAccount(BuildContext context) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AccountDeletionAlertBox(),
  );
}

class AccountDeletionAlertBox extends StatefulWidget {
  const AccountDeletionAlertBox({
    super.key,
  });

  @override
  State<AccountDeletionAlertBox> createState() =>
      _AccountDeletionAlertBoxState();
}

class _AccountDeletionAlertBoxState extends State<AccountDeletionAlertBox> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("delete account"),
      content: Text("just to confirm if you want to delete your account"),
      actions: [
        if (!isLoading)
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('cancel'),
          ),
        isLoading
            ? CircularProgressIndicator()
            : TextButton(
                onPressed: () {
                  //actually delete account
                  setState(() {
                    isLoading = true;
                  });
                  _chatService.deleteAccount(context).then(
                    (value) {
                      if (value) {
                        Navigator.pushReplacementNamed(context, '/signup');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('account deletion succesful'),
                          ),
                        );
                      } else {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('something went wrong'),
                          ),
                        );
                      }
                      setState(() {
                        isLoading = false;
                      });
                    },
                  );
                },
                child: Text('delete'),
              ),
      ],
    );
  }
}
