import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/models/darkmode.dart';
import 'package:portfolio_website/screens/home_screen.dart';
import 'package:portfolio_website/screens/screen1.dart';
import 'package:portfolio_website/screens/screen2.dart';
import 'package:provider/provider.dart';
import 'widgets/background_image.dart';
import 'widgets/brightness_icon.dart';
import 'widgets/contact_container.dart';
import 'widgets/url_functionality.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.black,
      routes: {
        '/home': (context) => HomeScreen(),
        '/screenOne': (context) => Screen1(),
        '/screenTwo': (context) => Screen2(),
      },
      home: BottomNavigationScreens(),
    );
  }
}

class BottomNavigationScreens extends StatefulWidget {
  const BottomNavigationScreens({
    super.key,
  });

  @override
  State<BottomNavigationScreens> createState() =>
      _BottomNavigationScreensState();
}

class _BottomNavigationScreensState extends State<BottomNavigationScreens> {
  List<Widget> screens = [
    HomeScreen(),
    Screen1(),
    Screen2(),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.transparent,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home,),
            backgroundColor: Colors.transparent
          ),
          BottomNavigationBarItem(
            label: 'Screen One',
            icon: Icon(Icons.accessibility),
            backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
            label: 'Screen two',
            icon: Icon(Icons.add_alert_sharp),
            backgroundColor: Colors.brown
          ),
        ],
        onTap: (tabNumberClicked){
          setState(() {
            selectedIndex = tabNumberClicked;
          });
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white24,
        currentIndex: selectedIndex,
        elevation: 0,

      ),
      body: screens[selectedIndex],
    );
  }
}
