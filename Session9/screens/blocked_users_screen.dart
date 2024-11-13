import 'package:firebase_project/services/chat/chat_interface.dart';
import 'package:flutter/material.dart';

class BlockedUsersScreen extends StatelessWidget {
  const BlockedUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('blocked users'),
      ),
      body: BlockedUsersList(),
    );
  }
}
