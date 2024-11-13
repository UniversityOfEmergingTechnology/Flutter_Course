import 'dart:math';

import 'package:flutter/material.dart';


class WaveClipper extends CustomClipper<Path>{

  List<Offset> _wavePoints = [];
  double value;
  bool forward;
  int direction;


  WaveClipper({required this.value, required this.forward}) : direction = forward ? 1 : -1;

  @override
  Path getClip(Size size) {
    var path = Path();
    _makeSinWave(size);

    path.addPolygon(_wavePoints, false);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  void _makeSinWave(Size size){
    final amplitude = 25;
    final yOffset = amplitude;
    final sinDisplacement = value*direction;

    for(int x = 0; x < size.width; x++){
      double y = amplitude * sin(x/(20) + sinDisplacement) + yOffset;
      Offset newPoint = Offset(x.toDouble(), y);
      _wavePoints.add(newPoint);
    }

  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;

}
