import 'package:flutter/material.dart';
import 'package:pharmaceutical_app/screens/home_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        dividerTheme: DividerThemeData(
          color: Colors.grey.withOpacity(0.2),
          space: 32,
          thickness: 5
        ),
      ),
      home: HomeScreen(),
    );
  }
}
