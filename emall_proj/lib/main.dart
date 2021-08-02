import 'package:emall_proj/Components/Login/Login.dart';
import 'package:emall_proj/Screens/HomeScreen.dart';
import 'package:emall_proj/Screens/LoginScreen.dart';
import 'package:flutter/material.dart';

import 'Screens/ShopScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'eMall',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyeMall(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyeMall extends StatefulWidget {
  String title;

  MyeMall({Key? key, required this.title}) : super(key: key);

  @override
  _MyeMallState createState() => _MyeMallState();
}

class _MyeMallState extends State<MyeMall> {
  @override
  Widget build(BuildContext context) {
    //return ShopScreen();
    return Login();
  }
}
