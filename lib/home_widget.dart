import 'package:catalytic/rewards_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'calendar_widget.dart';
import 'placeholder_widget.dart';
import 'challenges_widget.dart';
import 'rewards_widget.dart';

class Home extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    Center(
      child: ChallengeList()
    ),
    Center(
      child: Calendar()
    ),
    Center(
        child: RewardList()
    ),
    PlaceholderWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context)
            .copyWith(canvasColor: Colors.transparent).canvasColor,
        elevation: 0,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context)
            .copyWith(canvasColor: Colors.transparent).canvasColor,
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Calendar'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            title: Text('Rewards'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('Friends'),
            //backgroundColor: Colors.blueGrey,
          ),
        ],
        selectedItemColor: Colors.grey[900],
        unselectedItemColor: Theme.of(context).accentColor,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
      ),
      endDrawer: Drawer(
        //child: new CircleAvatar()
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              //padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new CircleAvatar(
                    backgroundImage: NetworkImage('https://images.pexels.com/photos/862848/pexels-photo-862848.jpeg?auto=compress&cs=tinysrgb&h=350',),
                    radius: 50,
                  ),
                  const Text(
                    'Angelique',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'Satisfy',
                    ),
                  ),
                ]
              ),
              decoration: const BoxDecoration(
                //color: Colors.blueGrey,
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

