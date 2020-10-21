import 'dart:developer';

import 'package:flutter/material.dart';
import 'models/gmailModel.dart';
import 'services/mailService.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List mailList = MailService().mailList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Let\'s be notified ',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: mailList.length,
          itemBuilder: (context, index) => Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      maxRadius: 20,
                      backgroundColor: Colors.redAccent,
                    ),
                    title: Text(mailList[index].senderEmailId),
                    subtitle: Text(mailList[index].message),
                  ),
                  Divider(
                    height: 20,
                  ),
                ],
              )),
    );
  }
}
