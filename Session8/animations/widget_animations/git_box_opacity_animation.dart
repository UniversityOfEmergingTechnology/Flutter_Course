import 'package:flutter/material.dart';

class GiftBoxOpacityAnimation extends StatelessWidget {
  const GiftBoxOpacityAnimation(
      {super.key, required this.opacity, required this.child});

  final double opacity;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: Duration(seconds: 1),
      child: child,
    );
  }
}