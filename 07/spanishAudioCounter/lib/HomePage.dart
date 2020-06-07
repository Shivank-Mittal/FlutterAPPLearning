import 'package:flutter/material.dart';

import 'package:audioplayers/audio_cache.dart';
import 'package:spanishAudioCounter/NumberAudio.dart';



class HomePage extends StatefulWidget {
  @override
   _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  AudioCache audioPlayer = AudioCache();

  List<NumberAudio> numberList = [
    NumberAudio("one.wav",Colors.red,"one"),
    NumberAudio("two.wav",Colors.cyan,"two"),
    NumberAudio("three.wav",Colors.indigo,"three"),
    NumberAudio("four.wav",Colors.lightBlue,"four"),
    NumberAudio("five.wav",Colors.lightGreen,"five"),
    NumberAudio("six.wav",Colors.lime,"six"),
    NumberAudio("seven.wav",Colors.orange,"seven"),
    NumberAudio("eight.wav",Colors.purple,"eight"),
    NumberAudio("nine.wav",Colors.pink,"nine"),
    NumberAudio("ten.wav",Colors.teal,"ten"),
    
  ];

  play(String uri){
    print('uri: ${uri}');
    audioPlayer.play(uri);
  }
   @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
      (
        title: Text('Spanish Number'),
      ),
      body: Container(
        child: Center(
          child: Column
          (
            children: <Widget>[
              Image(
                image: AssetImage("images/logo.png"),
              ),
              Expanded(
                child: GridView.builder
                (
                  padding: EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                  (
                    crossAxisCount: 3,
                    childAspectRatio: 2.0,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: this.numberList.length ,
                  itemBuilder: (context,i) => SizedBox
                  (
                    width: 100.0,
                    height: 50.0,
                    child: RaisedButton
                    (
                      color: numberList[i].buttonColor,
                      child: Text(numberList[i].buttonText),
                      onPressed: (){
                        play(numberList[i].audioUri);
                      }
                    ),
                  ),
                )
                )
            ],
          ),
        ),
      ),
    );
  }
} 