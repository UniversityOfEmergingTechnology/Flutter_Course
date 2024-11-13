import 'package:flutter/material.dart';

class DeleteAccountContainer extends StatelessWidget {
  const DeleteAccountContainer({super.key, required this.onTap});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        constraints:
            BoxConstraints(maxWidth: 500, maxHeight: 120, minHeight: 70),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "delete account",
              style: TextStyle(
                color: Theme.of(context).colorScheme.surface,
                fontSize: 15,
                letterSpacing: 4,
              ),
            )
          ],
        ),
      ),
    );
  }
}
