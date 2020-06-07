import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() => runApp(ScrachApp());

class ScrachApp extends StatelessWidget {

  @override
  Widget build(context){
    return MaterialApp(
      title: "Scrach and Win App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.amberAccent ),
      home: HomePage(),
    );
  }
}
