import 'package:firebase_project/theme/themes.dart';
import 'package:flutter/material.dart';

class MyFilledButton extends StatelessWidget {
  const MyFilledButton({super.key, required this.title, this.onTap});

  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 500,
          maxHeight: 70,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Center(
          child: Text(title,
              style: kMainTextStyle.copyWith(
                  color: Theme.of(context).colorScheme.surface)),
        ),
      ),
    );
  }
}
