import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:networking_tutorial/models/log_in_info_model.dart';
import 'package:networking_tutorial/models/picture_model.dart';

import 'name_model.dart';

class UserModel {
  UserModel(
      {required this.email,
      required this.gender,
      this.phoneNumber,
      required this.name,
  required this.nat,
         required this.loginInfo,
        required this.picture
      });

  String gender;
  String email;
  String? phoneNumber;
  Name name;
  String nat;
  Picture picture;
  LoginInfo  loginInfo;

  factory UserModel.fromJson(Map<String, dynamic> jsonObject) {
    return UserModel(
      email: jsonObject['email'],
      gender: jsonObject['gender'],
      nat : jsonObject['nat'],
      picture: Picture.fromJson(jsonObject['picture']),
      loginInfo: LoginInfo.fromJson(jsonObject['login']),
      name: Name.fromJson(
        jsonObject['name'],
      ),
    );
  }
}


