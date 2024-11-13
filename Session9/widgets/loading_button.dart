import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      ),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
