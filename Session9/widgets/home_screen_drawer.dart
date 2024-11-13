import 'package:firebase_project/screens/settings_screen.dart';
import 'package:firebase_project/services/authentication/auth_interface.dart';
import 'package:firebase_project/theme/themes.dart';
import 'package:flutter/material.dart';

class HomeScreenDrawer extends StatelessWidget {
  const HomeScreenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          DrawerHeader(
            child: Icon(
              Icons.chat_bubble,
              size: 50,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: Icon(
              Icons.home_filled,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              'home',
              style: kMainTextStyle.copyWith(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.secondary,
                  letterSpacing: 4),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/settings');
            },
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              'settings',
              style: kMainTextStyle.copyWith(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.secondary,
                  letterSpacing: 4),
            ),
          ),
          Spacer(),
          ListTile(
            onTap: () {
              signOut(context: context);
            },
            leading: Icon(
              Icons.logout_rounded,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              'logout',
              style: kMainTextStyle.copyWith(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.secondary,
                  letterSpacing: 4),
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
