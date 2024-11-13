import 'package:firebase_project/theme/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      constraints: BoxConstraints(maxWidth: 500, maxHeight: 120),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('dark mode'),
          CupertinoSwitch(
            value: Provider.of<ThemeProvider>(context).isDarkMode,
            onChanged: (value){
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
            activeColor: Theme.of(context).colorScheme.tertiary,
            thumbColor: Theme.of(context).colorScheme.secondary,
            trackColor: Theme.of(context).colorScheme.inversePrimary,
          )
        ],
      ),
    );
  }
}
