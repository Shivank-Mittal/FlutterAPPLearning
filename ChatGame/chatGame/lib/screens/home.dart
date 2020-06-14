import 'package:flutter/material.dart';
import 'calls.dart';
import 'camera.dart';
import 'chat.dart';
import 'status.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(  initialIndex: 1, length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lets Chat', style: TextStyle(color:  Colors.black),),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){}, color: Colors.white,),
          IconButton(icon: Icon(Icons.more_vert), onPressed: (){}, color: Colors.white,),
          IconButton(icon: Icon(Icons.gamepad), onPressed: (){}, color: Colors.white,),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(icon : Icon(Icons.camera_alt , color: Colors.white,)),
            Tab(child: Text('Chats',style:Theme.of(context).textTheme.button,),),
            Tab(child: Text('Status',style:Theme.of(context).textTheme.button,),),
            Tab(child: Text('Calls',style:Theme.of(context).textTheme.button,),),
          ],
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Camera(),
          Chat(),
          Status(),
          Calls()
        ],),
      floatingActionButton: FloatingActionButton( 
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(Icons.message, color: Colors.white,),
        onPressed: (){},
      ),
    );
  }
}