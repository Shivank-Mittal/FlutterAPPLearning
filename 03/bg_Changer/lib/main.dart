import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'),
        Locale('hi', 'IN'),
        Locale('zh', 'CN')
      ],
      title: 'Bg_Changer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Background Color Changer"),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static var colors = [
    Colors.amber,
    Colors.cyan,
    Colors.orange,
    Colors.pink,
    Colors.purple,
    Colors.teal,
    Colors.red,
    Colors.lime,
    Colors.lightGreen,
    Colors.indigoAccent,
  ];

  var currentColor = Colors.white;
  var currentBtnColor = Colors.black;

  setRandmColor() {
    var rndm = Random().nextInt(colors.length);

    setState(() {
      currentBtnColor = currentColor;
      currentColor = colors[rndm];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: currentColor,
        child: Center(
          child: RaisedButton(
            child: Text(
              'Change Color',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            padding: EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
            onPressed: setRandmColor,
            color: currentBtnColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
          ),
        ));
  }
}
