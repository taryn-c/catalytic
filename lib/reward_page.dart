import 'package:catalytic/challenges_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'img_url.dart';
import 'rewards_widget.dart';

class RewardPage extends StatefulWidget {
  @override
  _RewardPageState createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> {
  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Image.network(challenge_header, width: screenWidth, fit: BoxFit.fitWidth,),
          ),
          Expanded(
            flex: 7,
            child: Card(
                margin: EdgeInsets.all(15),
                child: RewardList()
            ),
          ),
        ],
      ),
    );
  }
}
