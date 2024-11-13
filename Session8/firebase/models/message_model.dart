import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Message {
  final String message;
  final String receiverId;
  final String senderId;
  final Timestamp timestamp;

  Message({
    required this.message,
    required this.receiverId,
    required this.senderId,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      "message": message,
      "receiverId": receiverId,
      "senderId": senderId,
      "timestamp": timestamp
    };
  }

}