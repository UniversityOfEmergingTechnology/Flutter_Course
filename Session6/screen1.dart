import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black26,
      child: Center(
          child: Text('Screen One', style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 40,
            color: Colors.black
          ),),
        ),
    );

  }
}
