import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() =>  runApp(ChatApp());

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LetsChat',
      theme: ThemeData(
        primaryColor:  Colors.purple,
        accentColor: Colors.purpleAccent,

        tabBarTheme:  TabBarTheme(
          labelColor: Colors.white
        ),

        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.white, fontSize: 16.0),
          bodyText1: TextStyle(color: Colors.black),
          button: TextStyle(color : Colors.white)
        ),

        bottomAppBarColor: Colors.white 
      ),

      home: Home(),
    );
  }
}