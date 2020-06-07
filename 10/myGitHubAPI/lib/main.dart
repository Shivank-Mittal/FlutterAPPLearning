import 'package:flutter/material.dart';
import 'Homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home : Homepage(title:'Parse Json Data'),
      
    );
  }
}