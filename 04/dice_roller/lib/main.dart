import 'package:flutter/material.dart';
import 'package:dice_roller/HomePage.Dart';


void main() => runApp(diceRoller());

class diceRoller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roller',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: HomePage(),
    );
    
  }
}