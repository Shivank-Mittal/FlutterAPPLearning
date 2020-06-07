import 'package:flutter/material.dart';
import 'NumberAudio.dart';

class NumberAudio{
  String audioUri;
  MaterialColor buttonColor;
  String buttonText;

  NumberAudio(String audURI, MaterialColor buttonColor , String buttonText){

    this.audioUri = audURI;
    this.buttonColor = buttonColor;
    this.buttonText = buttonText;
  }
}