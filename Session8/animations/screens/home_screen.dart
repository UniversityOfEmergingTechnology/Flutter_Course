import 'package:animations_lecture/screens/gift_box_screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightPink,
      appBar: AppBar(
        backgroundColor: kBlueGrey,
        title: Text(
          'Home Screen',
          style:
          TextStyle(color: Colors.white, decoration: TextDecoration.none),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                tileColor: kDarkPink,
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return GiftBoxScreen(indexClicked: index,);
                  },),);
                },
                leading: Hero(
                  tag: index,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:kDarkGrey,),
                    child: Icon(Icons.question_mark, color: Colors.white,),
                  ),
                ),
                title: Text('Surprise box number ${index + 1}', style: TextStyle(color: Colors.white),),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 10,
              );
            },
            itemCount: 10),
      ),
    );
  }
}
