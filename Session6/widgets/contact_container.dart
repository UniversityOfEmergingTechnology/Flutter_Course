import 'package:flutter/material.dart';
import 'package:portfolio_website/models/darkmode.dart';
import 'package:provider/provider.dart';

class ContactContainer extends StatelessWidget {
   const ContactContainer(
      {super.key,
      required this.contactInfo,
      required this.myIcon,
      });

  final String contactInfo;
  final IconData myIcon;

  @override
  Widget build(BuildContext context) {
    var color = context.watch<DarkMode>().darkMode ? Colors.black : Colors.white70;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      width: 450,
      height: 80,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: color),
      child: ListTile(
        leading: Icon(
          myIcon,
          color: Colors.pink.shade500,
          size: 45,
        ),
        title: Text(
          contactInfo,
          style: TextStyle(
              color: Colors.pink.shade700,
              fontSize: 22,
              overflow: TextOverflow.ellipsis),
        ),
      ),
    );
  }
}
