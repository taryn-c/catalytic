import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:catalytic/dialogbox_widget.dart';

Widget getTiles(MapEntry field) {
  return Opacity(
    opacity: 0.5,
    child: Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20,),
      child: new ListTile(
        title: new Text(field.value),
        //subtitle: new Text('Points: ' + document['points'].toString()),
        trailing: IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {
            //showSimpleCustomDialog(context, document, 0);

          },
        ),
      ),
    ),
  );
}

List<Widget> getUserList (List<DocumentSnapshot> documents) {
  List<Widget> userTiles = [];

  for (DocumentSnapshot document in documents) {
    for (MapEntry user in document.data.entries) {
      userTiles.add(getTiles(user));
    }
  }

  return userTiles;
}