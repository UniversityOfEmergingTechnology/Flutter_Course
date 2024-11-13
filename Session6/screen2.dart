import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.blueGrey,
      child: Center(
          child: Text('Screen Two', style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 40,
              color: Colors.white
          ),),
        ),
    );

  }
}