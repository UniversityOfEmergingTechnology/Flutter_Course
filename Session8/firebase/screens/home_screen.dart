import 'dart:js_interop';

import 'package:firebase_project/models/chat_screen_arguments.dart';
import 'package:firebase_project/services/chat/chat_interface.dart';
import 'package:firebase_project/theme/themes.dart';
import 'package:firebase_project/widgets/home_screen_drawer.dart';
import 'package:firebase_project/widgets/user_card.dart';
import 'package:flutter/material.dart';

import 'chat_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'people',
          style: kMainTextStyle.copyWith(
            fontSize: 20,
            letterSpacing: 8,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Icon(
                Icons.menu_rounded,
                size: 30,
                weight: 20,
                color: Theme.of(context).colorScheme.surface,
              ),
            );
          },
        ),
      ),
      drawer: HomeScreenDrawer(),
      body: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: UserList()
          ),
        ],
      ),
    );
  }
}
