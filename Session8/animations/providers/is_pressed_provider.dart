import 'package:flutter/foundation.dart';

class IsPressedProvider extends ChangeNotifier{
  bool isPressed = false;
  void setIsPressed(bool value){
    isPressed = value;
    notifyListeners();
  }
}