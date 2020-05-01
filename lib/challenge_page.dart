import 'package:catalytic/challenges_widget.dart';
import 'package:catalytic/heading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'img_url.dart';

class ChallengePage extends StatefulWidget {
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
                children: <Widget> [
                  Image.network(challenge_header, width: screenWidth, fit: BoxFit.fitWidth,),
                  Positioned.fill(
                    top: screenHeight * 0.10,
                    child: SizedBox(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 6,
                            child: Card(
                                margin: EdgeInsets.fromLTRB(20, 30, 20, 10),
                                child: Column(
                                    children: <Widget> [
                                      HeadingWidget(heading: 'Daily Challenges',),
                                      Expanded(
                                          child: ChallengeList()
                                      ),
                                ]
                              )
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              child: Card(
                                margin: EdgeInsets.fromLTRB(20, 10, 20, 30,),
                                child: Column(
                                  children: [
                                    HeadingWidget(heading: 'History',),
                                    Expanded(
                                      child: Row(
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
            ),
          ),
        ],
      ),
    );
  }
}
