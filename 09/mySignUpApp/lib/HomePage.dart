import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {

  final String name , email , colgName , number, password;

  Homepage( 
    {
      Key key,
      @required
      this.name,
      this.email,
      this.number,
      this.colgName,
      this.password
    }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text('HomePage'),),
      body: Form(
        child: Card(
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15.0)),
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(50),),
              Image(image: AssetImage('images/logo.png'), width: 100.0, height: 100.0,),
              ListTile(
                leading: Icon(Icons.people),
                title: Text(name),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text(email),
              ),
              ListTile(
                leading: Icon(Icons.lock_open),
                title: Text(password),
              ),
              ListTile(
                leading: Icon(Icons.phone_android),
                title: Text(number),
              ),
              ListTile(
                leading: Icon(Icons.school),
                title: Text(colgName),
              ),
            ],
          ),
        )
      ),
    );
  }
}