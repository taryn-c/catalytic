import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void showSimpleCustomDialog(BuildContext context, DocumentSnapshot document, int code) {
  Dialog simpleDialog = Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: Container(
      height: 200.0,
      width: 300.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: getDialogText(context, code),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Okay',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                RaisedButton(
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
  showDialog(
      context: context, builder: (BuildContext context) => simpleDialog);
}

Widget getDialogText(BuildContext context, int code) {
  switch(code) {
    case 0: {
      return Column(
        children: <Widget>[
          Text('Congrats!',
          style: TextStyle(
            //color: Colors.white,
            fontSize: 25,
            fontFamily: 'Satisfy',
          ),),
          Text('You have completed a challenge.',),
        ],
      );
    }
    break;

    case 1: {
      return Column(
        children: <Widget>[
          Text('Treat yo self!',
            style: TextStyle(
              //color: Colors.white,
              fontSize: 25,
              fontFamily: 'Satisfy',
            ),),
          Text('Redeem gift card?',),
//          RaisedButton(
//            color: Theme.of(context).accentColor,
//            onPressed: () {
//              Navigator.of(context).pop();
//            },
//            child: Text(
//              'Okay',
//              style: TextStyle(fontSize: 18.0, color: Colors.white),
//            ),
//          ),
        ],
      );
    }
    break;

    default: {
      //statements;
    }
    break;
  }
}