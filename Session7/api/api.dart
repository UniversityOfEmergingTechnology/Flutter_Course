import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:networking_tutorial/models/user_model.dart';

class MyApi{

  Future<List<UserModel>> fetchData() async {
    const String uri = "https://randomuser.me/api/?results=1000";
    final url = Uri.parse(uri);
    final response = await http.get(url);
    return compute(parseJson, response.body);
  }

  List<UserModel> parseJson(String responseBody){
  final jsonObject = jsonDecode(responseBody);
  final List<dynamic> results = jsonObject['results'];
  final listOfUserModels = results.map( (user) => UserModel.fromJson(user  as Map<String, dynamic>) ).toList();
  return listOfUserModels;
}

}