import 'package:catalytic/calendar_widget.dart';
import 'package:flutter/material.dart';
import 'img_url.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
                    top: screenHeight * .10,
                    child: SizedBox(
                      //height: screenHeight * 0.7,
                      child: Calendar(),
                    ),
                  ),
                ],
            ),
          ),
//          Expanded(
//            flex: 7,
//            child: Card(
//                margin: EdgeInsets.all(15),
//                child: Calendar()
//            ),
//          ),
        ],
      ),
    );
  }
}

