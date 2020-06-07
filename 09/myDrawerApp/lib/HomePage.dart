import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text('Drawer view'),),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text('Shiv@gmail.com'),
              accountName: Text('Shivank Mittal'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text('SM'),
              ),
            ),
            ListTile(
              title:Text('Home'), 
              trailing: Icon(Icons.home),
            ),
            ListTile(
              title:Text('Category'), 
              trailing: Icon(Icons.category),
              onTap: () => Navigator.of(context).pushNamed("/a"),
            ),
            ListTile(
              title:Text('Profile'), 
              trailing: Icon(Icons.more),
              onTap: () => Navigator.of(context).pushNamed("/p"),
            ),
            Divider(),
            ListTile(
              title:Text('Home'), 
              trailing: Icon(Icons.home),
            ),ListTile(
              title:Text('Close'), 
              trailing: Icon(Icons.close),
              onTap: ()=> Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('HomePage'),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.cloud_circle),
        onPressed: (){},
      ),
    );
  }
}