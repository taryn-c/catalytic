import 'package:catalytic/challenges_widget.dart';
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
            //width: screenWidth,
            //height: screenHeight * 0.3,
            //flex: 10,
            child: Stack(
                children: <Widget> [
                  Image.network(challenge_header, width: screenWidth, fit: BoxFit.fitWidth,),
                  Positioned.fill(
                    top: screenHeight * 0.10,
                    child: SizedBox(
                      //height: screenHeight * .90,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 5,
                            child: Card(
                                margin: EdgeInsets.fromLTRB(20, 30, 20, 10),
                                child: Column(
                                    children: <Widget> [
                                      Container(
                                          child: Text(
                                            'Daily Challenges',
                                            style: TextStyle(
                                              fontSize: 25,
                                              fontFamily: 'Satisfy',
                                            ),
                                          ),
                                          height: 55,
                                          padding: EdgeInsets.symmetric(vertical: 10),
                                      ),
                                      Expanded(
                                          //flex: 10,
                                          child: ChallengeList()
                                      ),
                                ]
                              )
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              child: Card(
                                margin: EdgeInsets.fromLTRB(20, 10, 20, 30,),
                                child: Column(
                                  children: [
                                    Container(
                                      child: Text(
                                        'History',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontFamily: 'Satisfy',
                                        ),
                                      ),
                                      height: 55,
                                      padding: EdgeInsets.symmetric(vertical: 10),
                                    ),
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
