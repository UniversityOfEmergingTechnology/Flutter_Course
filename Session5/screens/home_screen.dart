import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/screen1.dart';
import 'package:portfolio_website/screens/screen2.dart';
import 'package:provider/provider.dart';

import '../widgets/background_image.dart';
import '../widgets/brightness_icon.dart';
import '../widgets/contact_container.dart';
import '../models/darkmode.dart';
import '../widgets/profile_image.dart';
import '../widgets/url_functionality.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => DarkMode(),
        child: Stack(
          children: [
            BackgroundImage(),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  ProfileImage(),
                  Text(
                    'Drake',
                    style: TextStyle(
                        fontFamily: 'Snell',
                        fontSize: 90,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 5),
                  ),
                  Text(
                    'The rapper with most number ones',
                    style: TextStyle(
                        fontFamily: 'Bitter',
                        fontSize: 20,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 2),
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                    height: 80,
                    indent: 50,
                    endIndent: 50,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: launchUrl1,
                    child: ContactContainer(
                      contactInfo: 'aubreygram@instagram.com',
                      myIcon: Icons.mail_rounded,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: launchUrl2,
                    child: ContactContainer(
                      contactInfo: '+91 98765 43210',
                      myIcon: Icons.phone,
                    ),
                  ),
                ],
              ),
            ),
            BrightnessIcon()
          ],
        ),
      );

  }
}


