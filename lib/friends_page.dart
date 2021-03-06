import 'package:catalytic/friends_info.dart';
import 'package:catalytic/friends_widget.dart';
import 'package:catalytic/heading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'img_url.dart';

class FriendPage extends StatefulWidget {
  @override
  _FriendPageState createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
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
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 7,
                        child: Card(
                            margin: EdgeInsets.fromLTRB(20, 30, 20, 10),
                            child: Column(
                                children: <Widget> [
                                  HeadingWidget(heading: 'My Group'),
                                  Expanded(
                                      child: FriendsWidget()
                                  ),
                                ]
                            )
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          child: Card(
                            margin: EdgeInsets.fromLTRB(20, 10, 20, 30),
                            child: Column(
                                children: <Widget> [
                                  HeadingWidget(heading: 'My Friends',),
                                  SizedBox(child: FriendsImgWidget(), width: screenWidth,),
                                ]
                            ),
                            //],
                          ),
                        ),
                      ),
                    ],
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

