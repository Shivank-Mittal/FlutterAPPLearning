import 'package:flutter/material.dart';

import 'HomePage.dart';
void main() => runApp(TTTGame());

class TTTGame extends StatelessWidget {
  @override
  Widget build(context){
    return MaterialApp(
      title: 'Tic Tac Toe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple
      ),
      home: HomePage(),
    );
  }
}