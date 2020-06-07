import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //TODO:  impor Images
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage lucky = AssetImage("images/rupee.png");
  AssetImage unlucky = AssetImage("images/sadFace.png");


  //TODO: get an Array

  List<String> itemArray;
  int luckyNumber;
  int clickCounter = 0 ;

  //TODO: initilize array with 25 elements
  @override
  void initState()
  {
    super.initState();
    itemArray = List<String>.generate(25, (index) => "empty");
    generateLuckyNumber();
  }

  generateLuckyNumber(){
    int randm = Random().nextInt(24);

    setState(() {
      this.luckyNumber = randm;
    });
  }

  //TODO: define get image methord
  AssetImage getIamge(int index)
  {
    String currentState = itemArray[index];
    switch (currentState) {
      case "lucky": return lucky;
      break;
      case "unlucky": return unlucky;
      break;
      default:return circle;
    }

  }

  //TODO: playGame methord
  playGame(int index)
  {

    if(clickCounter >= 5)
    {
      showAll();
    }
    else
    {
        if(luckyNumber == index)
      {
        setState(() {
          itemArray[index] = "lucky";
        });
      }else
      {
        setState(() {
          itemArray[index] = "unlucky";
        });
      }
      clickCounter = clickCounter +1;
    }
    
  }

  //TODO show All

  showAll(){
    setState(() {
      itemArray = List<String>.filled(25, "unlucky");
      itemArray[this.luckyNumber] = "lucky";
    });
  }

  //TODO resetAll
  resetGame(){
    setState(() {
      itemArray = List<String>.filled(25, "empty");
      
    });
    clickCounter = 0;
    generateLuckyNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scratch and Win' , style: TextStyle(fontSize: 20) ,),
        ),
      body: Column
      (
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>
        [
          Expanded(
            child: GridView.builder 
            (
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 10.0
              ), 
              itemCount: itemArray.length,
              itemBuilder: (context ,i) => SizedBox(
                width: 50.0,
                height: 50.0,
                child: RaisedButton
                (
                  onPressed:(){
                    this.playGame(i);
                  } ,
                  child: Image(image: this.getIamge(i))
                ),
              )
            )
          ),
          Container(
            margin: EdgeInsets.all(15.0),
            child: RaisedButton
            (
              onPressed:(){showAll();},
              color: Colors.yellowAccent,
              child: Text('Show All'),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15.0),
            child: MaterialButton
            (
              onPressed: (){ resetGame();},
              color: Colors.red,
              child: Text('Reset Game'),
            ),
          )
        ],
      ),
    );
  }
}