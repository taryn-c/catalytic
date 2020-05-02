import 'package:catalytic/dialogbox_widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RewardList extends StatefulWidget {
  @override
  _RewardListState createState() => _RewardListState();
}

class _RewardListState extends State<RewardList> {
  final dbRef = Firestore.instance;

  Future getRewards() async {
    QuerySnapshot qs = await dbRef.collection('rewards').getDocuments();
    return qs; //array of document snapshots
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new FutureBuilder(
        //future: Firestore.instance.collection('challenges').getDocuments(),
        future: getRewards(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.data != null) {
            return new Column(
              children: <Widget>[
                new GridView(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
                  children: snapshot.data.documents
                      .map<Widget>((DocumentSnapshot document) {
                    return InkWell(
                      onTap: (){
                        showSimpleCustomDialog(context, document, 1);
                      },
                      child: Card(
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                        child: new GridTile(
                          child: Container(
                            alignment: Alignment.topCenter,
                            child: Padding(child: Image.network(document['photo'],),
                              padding: EdgeInsets.all(10),
                            ),
                          ),
                          footer: GridTileBar(
                            title: new Text(document['name'],
                              style: DefaultTextStyle.of(context).style.apply(),
                            ),
                            subtitle: new Text('Points: ' + document['points'].toString(),
                              style: DefaultTextStyle.of(context).style.apply(),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            );
          } else {
            return Center(child: new CircularProgressIndicator());
          }
        }, // Anon function
      ),
    );
  }
}


