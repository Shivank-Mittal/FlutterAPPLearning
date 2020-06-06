import 'package:flutter/material.dart';

void main(){

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('First line'),
            Text('Second line'),
            RaisedButton(
              onPressed: (){},
              child:Text('SignUp') ,
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

  }
}