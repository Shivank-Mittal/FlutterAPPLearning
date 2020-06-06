import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(){

runApp(MyCounter());

}
 

class MyCounter extends StatefulWidget
{
  @override
  MyCounterState createState(){
    return MyCounterState();
  }
}

class MyCounterState extends State<MyCounter>
{
  int counter=0;
  List<String> frenchNumbers =[
    'une',
    'deux',
    'trois',
    'quarte',
    'cinq',
    'six',
    'sept',
    'huit',
    'neuf',
    'dix'
  ]; 

  String DefaultText = "French Numbers";

  void displayNumbers(){
    setState(() {
      DefaultText = frenchNumbers[counter];

      if(counter <9 )
      {
        counter++;
      }else
      {
        counter= 0;
      }
    });
  }

  @override
  Widget build(context){
    return MaterialApp(
      theme: ThemeData(
        accentColor: Colors.orangeAccent ),
      home:Scaffold(
        appBar: AppBar(
          title: Text('French Counter'),
          backgroundColor: Colors.orangeAccent,
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                Text(DefaultText, style: TextStyle(fontSize: 30.0),),
                Text(counter.toString(), style: TextStyle(fontSize: 30.0),),
                Padding(padding: EdgeInsets.all(10.0),),
                // RaisedButton(
                //   child: Text('Call Numbers'),
                //   onPressed:displayNumbers ,
                //   color: Colors.orangeAccent,)
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:displayNumbers ,
          child: Icon(
            Icons.add,
            )
          ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      )
    );
  }

  
  
}
