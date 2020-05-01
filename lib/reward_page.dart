import 'package:catalytic/challenges_widget.dart';
import 'package:catalytic/heading_widget.dart';
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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.network(challenge_header, width: screenWidth, fit: BoxFit.fitWidth,),
              Positioned.fill(
                top: screenHeight * 0.10,
                child: SizedBox(
                  //height: screenHeight,
                  child: Column(
                    children: <Widget>[
                      Card(
                          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30,),
                          child: Column(
                            //mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              HeadingWidget(heading: 'Rewards',),
                              RewardList(),
                            ],
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
