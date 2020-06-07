import 'package:flutter/material.dart';
import 'HomePage.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  GlobalKey<FormState> _key = new GlobalKey();
  String name , email , colgName , number , password;


  _save(){
    if(_key.currentState.validate())
    {
      //saves to global key
      _key.currentState.save();

      //send to next screen
      Navigator.push(context, 
        MaterialPageRoute(
          builder:(context) =>  Homepage(
            name : name,
            email : email,
            number : number,
            colgName: colgName,
            password :password,
          ) 
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Center(
        child: SingleChildScrollView(
                child: Form(
            key: _key,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: <Widget>
                [
                  Padding(padding: EdgeInsets.all(10),),
                  Image(
                    image: AssetImage('images/logo.png'),
                    width: 100.0,
                    height: 100.0,),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: TextFormField(
                      validator: (input){
                        if(input.isEmpty) return 'Enter Name';
                      },
                      decoration: InputDecoration(
                        labelText: 'Name'
                      ),
                      onSaved: (input)=> name =input,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.email),
                    title: TextFormField(
                      validator: (input){
                        if(input.isEmpty) return 'Enter Email';
                      },
                      decoration: InputDecoration(
                        labelText: 'Email'
                      ),
                      onSaved: (input)=> email =input,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.lock),
                    title: TextFormField(
                      validator: (input){
                        if(input.isEmpty) return 'Enter Email';
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password'
                      ),
                      onSaved: (input)=> password =input,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: TextFormField(
                      validator: (input){
                        if(input.isEmpty) return 'Enter Number';
                      },
                      decoration: InputDecoration(
                        labelText: 'Number'
                      ),
                      onSaved: (input)=> number =input,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.school),
                    title: TextFormField(
                      validator: (input){
                        if(input.isEmpty) return 'Enter College Name';
                      },
                      decoration: InputDecoration(
                        labelText: 'College Name'
                      ),
                      onSaved: (input)=> colgName =input,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10),),
                  ButtonTheme(
                    minWidth: 200.0,
                    height: 40,
                    child: RaisedButton(
                      onPressed: (){
                        _save();
                      },
                      color: Colors.greenAccent,
                      child: Text('Save', style: TextStyle( fontSize: 20),),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10),),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}