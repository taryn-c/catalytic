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
                      return Card(
                        child: new ListTile(
                          title: new Text(document['desc']),
                          subtitle: new Text('Points: ' + document['points'].toString()),
                          leading: IconButton(
                            icon: Icon(Icons.check_box_outline_blank),
                            onPressed: () {},
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.more_vert),
                            onPressed: () {},
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


