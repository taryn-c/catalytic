import 'package:catalytic/dialogbox_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final dbRef = Firestore.instance;

class ChallengeList extends StatefulWidget {
  @override
  _ChallengeListState createState() => _ChallengeListState();

}

class _ChallengeListState extends State<ChallengeList> {

  Future getChallenges() async {
    QuerySnapshot qs = await dbRef.collection('challenges').getDocuments();
    return qs; //array of document snapshots
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new FutureBuilder(
        //future: Firestore.instance.collection('challenges').getDocuments(),
        future: getChallenges(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.data != null) {
            return new Column(
              children: <Widget>[
                new Expanded(
                  child: new ListView(
                    children: snapshot.data.documents
                        .map<Widget>((DocumentSnapshot document) {
                      return Opacity(
                        opacity: 0.5,
                        child: Card(
                          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20,),
//                        color: Theme.of(context)
//                          .copyWith(canvasColor: Colors.transparent).canvasColor,
                          child: new ListTile(
                            title: new Text(document['desc']),
                            subtitle: new Text('Points: ' + document['points'].toString()),
                            leading: IconButton(
                              icon: Icon(Icons.check_box_outline_blank),
                              onPressed: () {
                                showSimpleCustomDialog(context, document, 0);
                              },
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.more_vert),
                              onPressed: () {
                                //showSimpleCustomDialog(context, document, 0);
                              },
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            );
          } else {
            return new CircularProgressIndicator();
          }
        }, // Anon function
      ),
    );
  }
}


