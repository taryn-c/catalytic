import 'package:catalytic/group_tiles.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:catalytic/dialogbox_widget.dart';
import 'package:flutter/widgets.dart';

final dbRef = Firestore.instance;

class FriendsWidget extends StatefulWidget {
  @override
  _FriendsWidgetState createState() => _FriendsWidgetState();
}

class _FriendsWidgetState extends State<FriendsWidget> {
  Future getGroups() async {
    QuerySnapshot qs = await dbRef.collection('groups').getDocuments();
    return qs; //array of document snapshots
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          //height: 350,
          child: new FutureBuilder(
            future: getGroups(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.data != null) {
                return new Column(
                  children: <Widget>[
                    new Expanded(
                      child: new ListView(
                        padding: EdgeInsets.all(0),
                        children: getUserList(snapshot.data.documents),
                      ),
                    ),
                  ],
                );
              } else {
                return Center(child: new CircularProgressIndicator());
              }
            }, // Anon function
          ),
        )
      ],
    );
  }
}
