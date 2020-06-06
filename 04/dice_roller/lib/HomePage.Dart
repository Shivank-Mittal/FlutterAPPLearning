import 'dart:math';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
   _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  AssetImage one = AssetImage('images/one.png');
  AssetImage two = AssetImage('images/two.png');
  AssetImage three = AssetImage('images/three.png');
  AssetImage four = AssetImage('images/four.png');
  AssetImage five = AssetImage('images/five.png');
  AssetImage six = AssetImage('images/six.png');

  AssetImage diceImage;
  AssetImage diceImagetwo;

  @override
  void initState(){
    super.initState();

    setState(() {
      diceImage=one;
      diceImagetwo=one;
    });
  }

  void rollDice(){
    AssetImage newImage;
    AssetImage newImagetwo;

    for(var i = 0 ; i<2 ; i++){
      int randm = Random().nextInt(6) + 1;

        switch(randm){
        case 1 : {if(i==0)newImage = one; if(i==1) newImagetwo = one;}
        break;
        case 2 : {if(i==0)newImage = two; if(i==1) newImagetwo = two;}
        break;
        case 3 : {if(i==0)newImage = three; if(i==1) newImagetwo = three;}
        break;
        case 4 : {if(i==0)newImage = four; if(i==1) newImagetwo = four;}
        break;
        case 5 : {if(i==0)newImage = five; if(i==1) newImagetwo = five;}
        break;
        case 6 : {if(i==0)newImage = six; if(i==1) newImagetwo = six;}
        break;
      }

      
    }
    
    setState(() {
      diceImage=newImage;
      diceImagetwo = newImagetwo;
    });
  }

   @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Roller') ,),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container( 
                  margin: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image(
                        image: diceImage,
                        width: 100.0,
                        height: 100.0,
                      ),
                      
                      Image(
                        image: diceImagetwo,
                        width: 100.0,
                        height: 100.0,
                      ),
                    ],),
                  
                ),
                
                Container(
                  margin: EdgeInsets.all(30.0),
                  child: RaisedButton(
                    color: Colors.yellowAccent,
                    padding: EdgeInsets.fromLTRB(50.0, 25.0, 50.0, 25.0),
                    child: Text(
                      'Roll Dice!',
                      style: TextStyle(
                        fontSize: 25.0 , fontWeight: FontWeight.bold
                        ),
                      ),
                    onPressed: rollDice,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200.0)),
                  
                    ),
                )
              ],
            ),),
        ),
    );
  }
} 