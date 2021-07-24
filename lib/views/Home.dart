import 'package:flutter/material.dart';


import 'Settings.dart';
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

  void _showAddDrug() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10)
        )
      ),
      builder: (BuildContext ctx) {
        return _buildAddDrugBottomSheet();
      }
    );
  }

  Widget _buildAddDrugBottomSheet() {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.8,
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add A Drug',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 15)),
            TextFormField(
              style: TextStyle(
                color: Colors.black
              ),
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(
                  fontSize: 16
                )
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 15)),
            TextFormField(
              style: TextStyle(
                color: Colors.black
              ),
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Dosage (mg)',
                labelStyle: TextStyle(
                  fontSize: 16
                )
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 15)),
            TextFormField(
              style: TextStyle(
                color: Colors.black
              ),
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: 'Interval (hourly)',
                labelStyle: TextStyle(
                  fontSize: 16
                )
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 60)),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'ADD',
                style: TextStyle(fontSize: 18),
              ),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(400, 45))
              ),
            )
          ],
        ),
      ),
    );
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
          onPressed: _showAddDrug,
          backgroundColor: Color.fromRGBO(21, 101, 192, 1),
        ),
      ),
    );
  }
}
