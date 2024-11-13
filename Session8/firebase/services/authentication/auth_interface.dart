import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth_service.dart';

final _authService = AuthenticationService();

Future<void> logIn({required String email,required String password,required BuildContext context}) async {
  try {
    await _authService.logIn(email:  email,password:  password);
    if (context.mounted) Navigator.pushReplacementNamed(context, '/home');
  } catch (e) {
    if (context.mounted) {
      showAlert(context, e.toString());
    }
  }
}

Future<void> signUp({required String email,required String password,required String confirmPassword,
  required String name,required BuildContext context}) async {
  if (confirmPassword == password) {
    try {
      await _authService.signUp(email:  email,password:  password,name:  name);
      if (context.mounted) Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      if(context.mounted) showAlert(context, e.toString());
    }
  } else {
    showAlert(context, "Passwords do not match");
  }
}

void signOut({required BuildContext context}) async {
  try {
    await _authService.signOut();
    if (context.mounted) Navigator.pushReplacementNamed(context, '/login');
  } catch (e) {
    if (context.mounted) {
      showAlert(context, e.toString());
    }
  }
}

Future<dynamic> showAlert(BuildContext context, String errorString) {
  return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(errorString),
            ));
}
