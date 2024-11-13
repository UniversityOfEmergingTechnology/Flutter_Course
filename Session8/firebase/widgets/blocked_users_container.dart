import 'package:flutter/material.dart';

class BlockedUsersContainer extends StatelessWidget {
  const BlockedUsersContainer({super.key, required this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        constraints: BoxConstraints(maxHeight: 120, maxWidth: 500, minHeight: 70),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Theme.of(context).colorScheme.primary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'blocked users',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.surface,
                  fontSize: 15,
                  letterSpacing: 4),
            ),
            Icon(
              Icons.arrow_circle_right_rounded,
              color: Theme.of(context).colorScheme.onPrimary,
            )
          ],
        ),
      ),
    );
  }
}
