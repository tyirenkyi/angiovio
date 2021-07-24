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
      padding: EdgeInsets.only(left: 20, right: 20, top: 40),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Text(
                'Losartan',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(33, 33, 33, 1),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.timer_rounded, color: Color.fromRGBO(33, 33, 33, 1), size: 30,),
                ),
                Text(
                  'Every 8 hours',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(33, 33, 33, 1)
                  ),
                )
              ],
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10),),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.medication, color: Color.fromRGBO(33, 33, 33, 1), size: 30,),
                ),
                Text(
                  '2.5 mg',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(33, 33, 33, 1)
                  ),
                )
              ],
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 15),),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonTheme(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Mark As Taken',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(180, 45)
                    ),
                  ),
                  ),
                )
              ],
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 15)),
            Text(
              'Metadata',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),

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
