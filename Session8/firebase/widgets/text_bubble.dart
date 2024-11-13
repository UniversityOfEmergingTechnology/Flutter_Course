import 'package:firebase_project/theme/themes.dart';
import 'package:flutter/material.dart';

class TextBubble extends StatelessWidget {
  const TextBubble({super.key, required this.text, required this.isSentByUser});

  final String text;
  final bool isSentByUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isSentByUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          margin: isSentByUser
              ? EdgeInsets.fromLTRB(32, 8, 8, 8)
              : EdgeInsets.fromLTRB(8, 8, 32, 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isSentByUser
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary,
          ),
          child: Text(
            text,
            style: kMainTextStyle.copyWith(
                color: isSentByUser
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.onSecondary),
          ),
        )
      ],
    );
  }
}
