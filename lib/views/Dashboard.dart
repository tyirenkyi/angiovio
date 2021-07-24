import 'package:angiovio/widgets/DrugItem.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String _greeting = '';
  String _date = '';

  void loadGreetingAndDate() {
    String date = getDate();
    String greeting = determineGreeting();
    setState(() {
      _greeting = greeting;
      _date = date;
    });
  }

  @override
  void initState() {
    loadGreetingAndDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              _date,
              style: TextStyle(
                color: Colors.grey
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 5),),
            Text(
              _greeting,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              'Jim',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            DrugItem(),
            DrugItem(),
          ],
        ),
      ),
    );
  }
}
