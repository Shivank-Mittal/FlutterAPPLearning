import 'package:flutter/material.dart';

void main(){

  var app = MaterialApp(
    title: 'Flutter Stateless App',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: Colors.orangeAccent,
        accentColor:  Colors.tealAccent,
    ),
    home: Scaffold(
      appBar: AppBar(
        title: Text('Stateless App')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('First line'),
            Text('Second line'),
            RaisedButton(
              onPressed: (){},
              child:Text('Login') ,
              color: Colors.orange,
              splashColor: Colors.deepOrangeAccent,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){},
        child: Icon(
          Icons.add_a_photo,
        ),
      ),
    ),
  );

  runApp(app);
}