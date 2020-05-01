import 'package:flutter/material.dart';

class HeadingWidget extends StatelessWidget {

  final String heading;

  const HeadingWidget({Key key, @required this.heading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    child: Text(
    heading,
    style: TextStyle(
        fontSize: 25,
        fontFamily: 'Satisfy',
        ),
      ),
      height: 55,
      padding: EdgeInsets.symmetric(vertical: 10),
    );
  }
}
