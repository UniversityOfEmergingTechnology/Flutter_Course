import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Scaffold.of(context).openDrawer();
      },
      child: CircleAvatar(
        backgroundColor: Colors.pinkAccent,
        radius: 85,
        backgroundImage: AssetImage('images/theboy.JPG'),
      ),
    );
  }
}