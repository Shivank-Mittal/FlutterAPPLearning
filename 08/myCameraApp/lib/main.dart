import 'package:flutter/material.dart';
import 'MyhomePage.dart';
void main() => runApp(CampApp());

class CampApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CampApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
       ),
       home: MyHomePage(),
    );
  }
}