import 'package:flutter/material.dart';

class DarkMode extends ChangeNotifier{
  bool darkMode = false;

  void toggleDarkMode(){
    darkMode = !darkMode;
    notifyListeners();
  }
}