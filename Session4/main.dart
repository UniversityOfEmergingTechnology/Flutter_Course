import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              'Summary',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 28,
                decoration: TextDecoration.none
              ),
            ),
            centerTitle: false,
            actions: [
              Container(
                padding: EdgeInsets.only(right: 12),
                child: Icon(Icons.ac_unit),
              )
            ],
          ),
          body: Center(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return MyHealthAppWidget();
              },
            ),
          ),
        ));
  }
}

class MyHealthAppWidget extends StatelessWidget {
  const MyHealthAppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 26, 25, 23),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.access_time,
                  color: Colors.red,
                  size: 16,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Time Elapsed',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    fontSize: 12,
                  ),
                ),
                Spacer(),
                Text(
                  '02:35 PM',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w100,
                      fontSize: 10,
                      decoration: TextDecoration.none),
                ),
                SizedBox(
                  width: 4,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                  size: 8,
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '66',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      decoration: TextDecoration.none),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'BPM',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w100,
                      fontSize: 16,
                      decoration: TextDecoration.none),
                ),
              ],
            )
          ],
        ));
  }
}
