import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage edit = AssetImage("images/edit.png");


  bool isCross = true;
  String message;

  List<String> gameState;

  

  // initilization methord
  @override
  void initState(){
    super.initState();
    setState(() {
      this.gameState= [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];

      this.message ="";
    });
  } 

  //PlayGame Methord
  playGame (int index){

    if(gameState[index] == "empty"){
      
      setState(() {

        if(isCross)this.gameState[index] = "cross";
        else this.gameState[index] = "circle";
        
        this.isCross =   !this.isCross;

        this.checkWin();

      });
    }

  }

  //TODO: Reset Game methord

  resetGame(){
    setState(() {
      this.gameState= [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];

      this.message ="";
    });
  }

  //TODO: GetImage methord

  AssetImage getImage(String value){

    switch (value) {
      case 'circle':
        return circle;
        break;
      case 'cross':
        return cross;
        break;
      case 'empty':
        return edit;
        break;
      default :
      return edit;
      break;
    }
  }

  //TODO: Check for winning Logic
  checkWin(){
    if((gameState[0] != "empty") && (gameState[0] == gameState[1]) && (gameState[1] == gameState[2])  ){
      
      setState(() {
      this.message ='${this.gameState[0]} wins';
    });
    }
    else if((gameState[3] != "empty") && (gameState[3] == gameState[4]) && (gameState[4] == gameState[5])  ){
      
      setState(() {
      this.message ='${this.gameState[3]} wins';
    });
    }
    else if((gameState[6] != "empty") && (gameState[6] == gameState[7]) && (gameState[7] == gameState[8])  ){
      
      setState(() {
      this.message ='${this.gameState[6]} wins';
    });
    }
    else if((gameState[0] != "empty") && (gameState[0] == gameState[3]) && (gameState[3] == gameState[6])  ){
      
      setState(() {
      this.message ='${this.gameState[0]} wins';
    });
    }
    else if((gameState[1] != "empty") && (gameState[1] == gameState[4]) && (gameState[4] == gameState[7])  ){
      
      setState(() {
      this.message ='${this.gameState[1]} wins';
    });
    }
    else if((gameState[2] != "empty") && (gameState[2] == gameState[5]) && (gameState[5] == gameState[8])  ){
      
      setState(() {
      this.message ='${this.gameState[2]} wins';
    });
    }
    else if((gameState[0] != "empty") && (gameState[0] == gameState[4]) && (gameState[4] == gameState[8])  ){
      
      setState(() {
      this.message ='${this.gameState[0]} wins';
    });
    }
    else if((gameState[2] != "empty") && (gameState[2] == gameState[4]) && (gameState[4] == gameState[6])  ){
      
      setState(() {
      this.message ='${this.gameState[2]} wins';
    });
    }
    else if(!gameState.contains('empty')){
      setState(() {
        this.message = 'Game Draw';
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe') ,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(15.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10 ),
                itemCount: this.gameState.length,
                itemBuilder: (context,i) => SizedBox(
                  width: 10,
                  height: 10,
                  child: MaterialButton(
                    onPressed:(){
                      playGame(i);
                    },
                    child: Image(
                      image: this.getImage(this.gameState[i]),
                      )
                    ),
                  ),
              ),
            ),
            Container
            (
              padding: EdgeInsets.all(20),
              child: Text
              (
                this.message,
                style: TextStyle
                (
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            MaterialButton
            (
              color: Colors.purpleAccent,
              minWidth: 300.0,
              height: 50.0,
              child: Text('Reset Game',
                style:TextStyle(color: Colors.white, fontSize: 20.0) ,) ,
              onPressed:()
              {
                this.resetGame();
              } ,
            ),
            Container
            (
              padding: EdgeInsets.all(20.0),
              child: Text('@Shiv'))
          ],
          ),
      );
  }
}