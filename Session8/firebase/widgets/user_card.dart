import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard(
      {super.key, required this.onTap, required this.title, required this.email});

  final Function() onTap;
  final String title;
  final String email;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          constraints: BoxConstraints(maxHeight: 120, minWidth: 500),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.surface,
                    fontSize: 15,
                    letterSpacing: 4),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                email,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.surface,
                    fontSize: 12,
                    letterSpacing: 2),
              )
            ],
          ),
        ),
      ),
    );
  }
}
