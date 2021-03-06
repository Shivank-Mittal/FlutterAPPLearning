import 'package:sqflite/sqflite.dart';
import 'Note.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper{

  static DatabaseHelper _databaseHelper; //singleton
  static Database _database;  //singleton

  String noteTable ='note_table';
  String colID = 'id';
  String colTitle ='title';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colDate = 'date';

  DatabaseHelper._createInstance(); 


  factory DatabaseHelper(){
    if(_databaseHelper == null){
      _databaseHelper == DatabaseHelper._createInstance();
    }
    return  _databaseHelper;
  }

//custom database getter
  Future<Database> get database async{
    if(_database == null)
    {
      _database = await initializeDatabase();
    }

    return _database;
  }

  Future<Database> initializeDatabase() async{

    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path +'notes.db';//notes.db is a database name , can be named anything

    var notesDatabase = await openDatabase(
      path, version: 1, onCreate: _createDb 
     );

     return notesDatabase;
  }

  void _createDb( Database db, int newVersion) async{

    await db.execute(
      'CREATE TABLE $noteTable ($colID INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, $colDescription TEXT, $colPriority INTEGER, $colDate TEXT  )'
    );
  }

  Future<List<Map<String,dynamic>>>  getNoteMapList() async {
    Database db = await this.database;

    var result = await db.query(noteTable, orderBy: '$colPriority ASC'); // Its a select all query

    return result;
  }
  

  Future<int> insertNote(Note note) async {
    Database db = await this.database;

    var result = await db.insert(noteTable, note.toMap());
    return result;
  }
  Future<int> updateNote(Note note) async {
    Database db = await this.database;

    var result = await db.update(noteTable, note.toMap(), where: '$colID = ?' , whereArgs: [note.id]);
    return result;
  }
  Future<int> deleteNote(int id) async {
    Database db = await this.database;

    var result  = await db.rawDelete('DELETE From $noteTable where $colID = $id');
    return result;
  }

  Future<int> getCount() async{
    Database db = await this.database;

    List<Map<String,dynamic>> x = await db.rawQuery('Select count(*) from $noteTable');
    int result = Sqflite.firstIntValue(x);

    return result;
  }

  Future<List<Note>> getNotes() async{
    var noteMapList = await getNoteMapList();

    List<Note> noteList = List<Note>();

    for (var i = 0; i < noteMapList.length; i++) {
      noteList.add(Note.fromMapObject(noteMapList[i]));
    }

    return noteList;
  }

}