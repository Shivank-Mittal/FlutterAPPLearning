import 'package:flutter/material.dart';


class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pofile'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image(image: AssetImage('images/MyPic.jpeg'),
            width: 200,
            height: 100,
            ),
            Padding (padding: EdgeInsets.all(20),),
            Text('Shivank Mittal', style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}