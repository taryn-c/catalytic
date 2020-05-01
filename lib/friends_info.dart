import 'package:catalytic/group_tiles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:catalytic/dialogbox_widget.dart';
import 'package:flutter/widgets.dart';

final dbRef = Firestore.instance;

class FriendsImgWidget extends StatefulWidget {
  @override
  _FriendsImgWidgetState createState() => _FriendsImgWidgetState();
}

class _FriendsImgWidgetState extends State<FriendsImgWidget> {
  Future getUsers() async {
    QuerySnapshot qs = await dbRef.collection('users').getDocuments();
    return qs; //array of document snapshots
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: new FutureBuilder(
        future: getUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.data != null) {
            return new Row(
              children: snapshot.data.documents
                  .map<Widget>((DocumentSnapshot document) {
                return Column(
                  children: <Widget>[
                    new Container(
                        margin: EdgeInsets.all(10),
                        width: 125.0,
                        height: 125.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: new NetworkImage(
                                    document['photo'])
                            )
                        )
                    ),
                    Text(document['first'], textAlign: TextAlign.center,),
                  ],
                );
              }).toList(),
            );
            //);
          } else {
            return Center(child: new CircularProgressIndicator());
          }
        }, // Anon function
      )
    );
  }
}

Widget getFriendImg(MapEntry field) {
  return new Container(
      width: 190.0,
      height: 190.0,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
              fit: BoxFit.fill,
              image: new NetworkImage(
                  "https://i.imgur.com/BoN9kdC.png")
          )
      )
  );
}

List<Widget> getUserImgs (List<DocumentSnapshot> documents) {
  List<Widget> userImgs = [];

  for (DocumentSnapshot document in documents) {
    for (MapEntry user in document.data.entries) {
      userImgs.add(getFriendImg(user));
    }
  }

  return userImgs;
}