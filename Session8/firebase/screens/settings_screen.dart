import 'package:flutter/material.dart';

import '../widgets/blocked_users_container.dart';
import '../widgets/delete_account_container.dart';
import '../widgets/theme_switch.dart';
import '../services/chat/chat_interface.dart' as ci;

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Settings Screen'
        ),
      ),
      body: Center(
        child: Column(
          children: [
            ThemeSwitch(),
            BlockedUsersContainer(onTap: () {
              Navigator.pushNamed(context, '/blockedUsersScreen');
            },),
            Spacer(),
            DeleteAccountContainer(
              onTap: (){
                ci.deleteAccount(context);
              },
              key: ValueKey('delete account'),
            ),
          ],
        ),
      ),
    );
  }
}
