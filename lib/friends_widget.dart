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
    return Container(
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20,),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('My Groups',
                style: TextStyle(
                  //color: Colors.white,
                  fontSize: 35,
                  fontFamily: 'Satisfy',
                ),
              ),
              Container(
                height: 200,
                child: new FutureBuilder(
                  future: getGroups(),
                  builder: (BuildContext context, AsyncSnapshot snapshot){
                    if(snapshot.data != null) {
                      return new Column(
                        children: <Widget>[
                          new Expanded(
                            child: new ListView(
                              children: getUserList(snapshot.data.documents),
//                                return Opacity(
//                                  opacity: 0.5,
//                                  child: Card(
//                                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20,),
//                                    //                        color: Theme.of(context)
//                                    //                          .copyWith(canvasColor: Colors.transparent).canvasColor,
//                                    child: new ListTile(
//                                      title: new Text(document['user1']),
//                                      //subtitle: new Text('Points: ' + document['points'].toString()),
//                                      trailing: IconButton(
//                                        icon: Icon(Icons.more_vert),
//                                        onPressed: () {
//                                          //showSimpleCustomDialog(context, document, 0);
//                                        },
//                                      ),
//                                    ),
//                                  ),
//                                );
                              //.toList(),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return new CircularProgressIndicator();
                    }
                  }, // Anon function
                ),
              )
            ],
          ),
      ),
    );
  }
}
