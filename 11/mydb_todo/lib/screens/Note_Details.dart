import 'package:flutter/material.dart';
import '../Database_Helper.dart';
import '../Note.dart';
import 'package:intl/intl.dart';



class NoteDetail extends StatefulWidget {

  final String appBarTitle;
  final Note note;

  NoteDetail(this.note, this.appBarTitle);

  @override
  NoteDetailState createState() => NoteDetailState(this.note, this.appBarTitle);
}

class NoteDetailState extends State<NoteDetail> {

  static var _priorities = ['HIGH', 'LOW'];
  DatabaseHelper helper = DatabaseHelper();

  String appBarTitle;
  Note note; 

  NoteDetailState(this.note, this.appBarTitle);

  TextEditingController titleControler = TextEditingController();
  TextEditingController descriptionControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline6;

    titleControler.text = note.title;
    descriptionControler.text = note.description;

    return WillPopScope(
      onWillPop: (){moveToLastScreen();},
      child: Scaffold(
        backgroundColor: Colors.cyanAccent ,
        appBar: AppBar(
          title: Text(appBarTitle),
          backgroundColor: Colors.pink,
          leading: IconButton(
            icon: Icon( Icons.arrow_back),
            onPressed: (){ moveToLastScreen();},),
        ),
        body: Padding(
            padding: EdgeInsets.all(10.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 5.0),
                    //dropdown menu
                    child: new ListTile(
                      leading: const Icon(Icons.low_priority),
                      title: DropdownButton(
                          items: _priorities.map((String dropDownStringItem) {
                            return DropdownMenuItem<String>(
                              value: dropDownStringItem,
                              child: Text(dropDownStringItem,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red)),
                            );
                          }).toList(),
                          value: getPriorityAsString(note.priority),
                          onChanged: (valueSelectedByUser) {
                            setState(() {
                              updatePriorityToInt(valueSelectedByUser);
                            });
                          }),
                    ),
                  ),
                  // Second Element
                  Padding(
                    padding:
                        EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0),
                    child: TextField(
                      controller: titleControler,
                      style: textStyle,
                      onChanged: (value) {
                        updateTitle();
                      },
                      decoration: InputDecoration(
                        labelText: 'Title',
                        labelStyle: textStyle,
                        icon: Icon(Icons.title),
                      ),
                    ),
                  ),

                  // Third Element
                  Padding(
                    padding:
                        EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0),
                    child: TextField(
                      controller: descriptionControler,
                      style: textStyle,
                      onChanged: (value) {
                        updateDescription();
                      },
                      decoration: InputDecoration(
                        labelText: 'Details',
                        icon: Icon(Icons.details),
                      ),
                    ),
                  ),

                  // Fourth Element
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            textColor: Colors.white,
                            color: Colors.green,
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Save',
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () {
                              setState(() {
                                debugPrint("Save button clicked");
                                _save();
                              });
                            },
                          ),
                        ),
                        Container(
                          width: 5.0,
                        ),
                        Expanded(
                          child: RaisedButton(
                            textColor: Colors.white,
                            color: Colors.red,
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Delete',
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () {
                              setState(() {
                                _delete();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }


  void updateTitle(){
    note.title = titleControler.text;
  }

  void updateDescription(){
    note.description = descriptionControler.text;
  }

  void _save() async{
    moveToLastScreen();

    note.date = DateFormat.yMMMd().format(DateTime.now());

    int result ;
    if(note.id != null ){
      result = await helper.updateNote(note);
    }else{
      result = await helper.insertNote(note);
    }

    if(result != 0){
      _shoAlertDialog('Status','Note saved successfully');
    }else {
      _shoAlertDialog('Status','Problem saving note');
    }
  }

  void _delete() async{
    moveToLastScreen();
    
    if(note.id == null){
      _shoAlertDialog('Status', 'First Add Note');

      return ;
    }

    int result = await helper.deleteNote(note.id);

    if(result != 0){
      _shoAlertDialog('Status','Note deleted successfully');
    }else {
      _shoAlertDialog('Status','Error');
    }
  }

  void updatePriorityToInt( String value){
    switch(value){
      case 'HIGH':
        note.priority = 1;
      break;

      case 'LOW':
        note.priority = 2;
      break;

    }
  }

  String  getPriorityAsString( int value){
    String priority;
    switch(value){
      case 1:
        priority = _priorities[0];
      break;

      case 2:
        priority = _priorities[1];
      break;

    }

    return priority;
  }

  void moveToLastScreen(){
    Navigator.pop(context,true);
  }


  void _shoAlertDialog(String title, String message){
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );

    showDialog(context: context , builder:  (_) => alertDialog); //(_) is used because it will have a private message
  }
}