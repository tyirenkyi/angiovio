import 'package:angiovio/views/Settings.dart';
import 'package:flutter/material.dart';

import 'Dashboard.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int routeIndex = 0;
  List<Widget> _routes = [
    Dashboard(),
    Settings(),
  ];

  void _onTabItemTapped(int index) {
    setState(() {
      routeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async { return Future.value(false); },
      child: Scaffold(
        body: Container(
          child: _routes[routeIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          unselectedIconTheme: IconThemeData(
            color: Colors.grey
          ),
          elevation: 6,
          backgroundColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_outlined),
              label: 'Dashboard'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Settings'
            )
          ],
          currentIndex: routeIndex,
          selectedItemColor: Theme.of(context).accentColor,
          onTap: _onTabItemTapped,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
          backgroundColor: Color.fromRGBO(21, 101, 192, 1),
        ),
      ),
    );
  }
}
