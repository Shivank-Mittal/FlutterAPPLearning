import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Homepage extends StatefulWidget {

  final String title;
  Homepage( 
    { 
      Key key, 
      @required
      this.title
    } ) : super(key : key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final String gitURL = "https://api.github.com/users";
  List data;
  var isLodding = false;

  @override
  void initState(){
    super.initState();

    this.getJsonData();
  }

  Future<String> getJsonData( ) async{
    var responce = await http.get(
      Uri.encodeFull(gitURL)
    );

    // print(responce.body);

    setState(() {
      var JSONData = json.decode(responce.body);
      data  = JSONData;

      print(data);
    });

    
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context,int index){
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text(data[index]["login"], style: TextStyle(fontSize: 20.0),),
                  subtitle: Text(data[index]["url"], style: TextStyle(fontSize: 15.0),),
                )
              ],
            ),
          );
        }
      ),
      );
  }
}