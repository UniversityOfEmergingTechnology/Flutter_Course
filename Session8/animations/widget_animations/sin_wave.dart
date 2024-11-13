import 'package:flutter/material.dart';

import '../widgets/gradient_container.dart';
import '../widgets/wave_clipper.dart';

class SinWave extends AnimatedWidget {
  const SinWave({
    super.key,
    required this.sinAnimation,
    required this.forward,
  }) : super(listenable: sinAnimation);

  final Animation sinAnimation;
  final bool forward;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipper(value: sinAnimation.value, forward: forward),
      child: GradientContainer(),
    );
  }
}