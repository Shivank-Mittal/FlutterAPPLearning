import 'package:flutter/material.dart';

import 'HomePage.dart';

void main() => runApp(SpanichNumber());

class SpanichNumber extends StatelessWidget 
{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Spanic Numbers',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home:HomePage()
    );
  }
}

