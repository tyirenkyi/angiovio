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
  List<String> _routeNames = [
    'TODAY',
    'SETTINGS'
  ];
  Map<String, dynamic> newDrug = {
    'user': '',
    'name': '',
    'dosage': 0,
    'interval': 0,
    'missed': 0,
    'taken': 0,
    'repeats': 0
  };
  int interval = 0;

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
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter state) {
            return _buildAddDrugBottomSheet(state);
          },
        );
      },
      isScrollControlled: true
    );
  }

  Widget _buildAddDrugBottomSheet(StateSetter setState) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.8,
      decoration: BoxDecoration(
        color: Color.fromRGBO(33, 33, 33, 1)
      ),
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add A Drug',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 15)),
            TextFormField(
              style: TextStyle(
                color: Colors.white
              ),
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.white
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white
                  )
                )
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 15)),
            TextFormField(
              style: TextStyle(
                color: Colors.white
              ),
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Dosage (mg)',
                labelStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.white
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white
                  )
                )
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 25)),
            Text('Interval', style: TextStyle(fontSize: 16, color: Colors.white),),
            DropdownButton<int>(
              icon: Icon(Icons.arrow_drop_down),
              value: interval,
              iconSize: 20,
              elevation: 5,
              style: TextStyle(color: Colors.white),
              underline: Container(
                height: 2,
                color: Colors.blue,
              ),
              onChanged: (int? newValue) {
                setState(() {
                  interval = newValue!;
                });
              },
              items: <int>[0, 6, 8, 12, 24]
                .map<DropdownMenuItem<int>>((int value) => (
                  DropdownMenuItem<int>(
                    value: value,
                    child: Text('$value hours', style: TextStyle(color: Colors.grey),)
                  )
              )).toList(),
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
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 1,
          title: Row(
            children: [
              Container(
                child: Image.asset('assets/images/logo.png'),
                width: 40,
                height: 40,
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
              Text(
                _routeNames[routeIndex],
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 16
                ),
              )
            ],
          ),
        ),
        backgroundColor: Color.fromRGBO(33, 33, 33, 1),
        body: Container(
          child: _routes[routeIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          unselectedIconTheme: IconThemeData(
            color: Colors.grey
          ),
          elevation: 6,
          backgroundColor: Color.fromRGBO(25, 25, 25, 1),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              label: 'Today',
              backgroundColor: Color.fromRGBO(25, 25, 25, 1)
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
              backgroundColor: Color.fromRGBO(25, 25, 25, 1)
            )
          ],
          currentIndex: routeIndex,
          selectedItemColor: Colors.white,
          onTap: _onTabItemTapped,
        ),
        floatingActionButton: routeIndex == 0 ?FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _showAddDrug,
          backgroundColor: Color.fromRGBO(21, 101, 192, 1),
        ) : null,
      ),
    );
  }
}
