import 'package:flutter/material.dart';
import 'package:portfolio_website/models/darkmode.dart';
import 'package:provider/provider.dart';

class BrightnessIcon extends StatelessWidget {
  BrightnessIcon({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      right: 10,
      child: GestureDetector(
        onTap: () {
          context.read<DarkMode>().toggleDarkMode();
        },
        child: context.watch<DarkMode>().darkMode
            ? Icon(
          Icons.brightness_2,
          size: 30,
          color: Colors.grey,
        )
            : Icon(
          Icons.brightness_high,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}