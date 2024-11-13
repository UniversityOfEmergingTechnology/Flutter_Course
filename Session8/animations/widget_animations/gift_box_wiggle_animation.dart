import 'dart:math';

import 'package:flutter/material.dart';

class GiftBoxWiggleAnimation extends StatelessWidget {
  const GiftBoxWiggleAnimation({super.key, required this.endValue, required this.child});

  final double endValue;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: endValue),
      duration: Duration(seconds: 1),
      builder: (context, value, __) {
        return Transform.translate(
          offset: Offset(0, sin(value)*25),
          child: child,
        );
      },
    );
  }
}