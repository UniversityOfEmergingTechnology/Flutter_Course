import 'package:flutter/material.dart';
import 'package:portfolio_website/models/darkmode.dart';
import 'package:provider/provider.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var displayImage = context.watch<DarkMode>().darkMode
        ? const AssetImage('images/background2.png')
        : const AssetImage('images/InstagramGradientFinal.jpg');
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(image: displayImage, fit: BoxFit.cover),
      ),
    );
  }
}
