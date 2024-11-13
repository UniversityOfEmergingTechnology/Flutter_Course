import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:networking_tutorial/api/api.dart';
import 'package:networking_tutorial/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UserModel> users = [];
  bool darkMode = false;


  @override
  void initState() {
    // TODO: implement initState
    retriveDarkMode();
    fetchUsers();
    super.initState();
  }

  void setDarkMode(bool selectedDarkMode) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('Dark Mode', selectedDarkMode);
  }

  Future<void> retriveDarkMode() async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      darkMode = prefs.getBool('Dark Mode') ?? false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? Colors.blueGrey : Colors.white,
      appBar: AppBar(
        title: Text(
          'API integration',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: darkMode ? Colors.black : Colors.grey,
        actions: [
          Switch(value: darkMode, onChanged: (changedValue){
            setState(() {
              setDarkMode(changedValue);
              darkMode = changedValue;
            });
          })
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.picture.thumbnail),
            ),
            title: Text(
              user.name.fullName,
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              user.nat,
              style: TextStyle(color: Colors.white70),
            ),
          );
        },
        itemCount: users.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }

  Future<void> fetchUsers() async {
    final listOfUserModels = await MyApi().fetchData();
    setState(() {
      users = listOfUserModels;
    });
  }
}
