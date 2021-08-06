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

  void _showDrugDetail() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10)
            )
        ),
        builder: (BuildContext ctx) {
          return _buildDrugDetailBottomSheet();
        }
    );
  }

  Widget _buildDrugDetailBottomSheet() {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.8,
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      decoration: BoxDecoration(
        color: Color.fromRGBO(33, 33, 33, 1)
      ),
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
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.timer_rounded, color: Colors.white, size: 30,),
                ),
                Text(
                  'Every 8 hours',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white
                  ),
                )
              ],
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10),),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.medication, color: Colors.white, size: 30,),
                ),
                Text(
                  '2.5 mg',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white
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
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Text(
              'Added on 15th June, 2020',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Taken',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey
                  ),
                ),
                Text(
                  '10 doses',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white
                  ),
                )
              ],
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Missed',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey
                  ),
                ),
                Text(
                  '10 doses',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 10, left: 8, right: 8),
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
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            Text(
              'Jim',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            DrugItem(_showDrugDetail),
            DrugItem(_showDrugDetail),
            DrugItem(_showDrugDetail),
            DrugItem(_showDrugDetail),
            DrugItem(_showDrugDetail),
            DrugItem(_showDrugDetail)
          ],
        ),
      ),
    );
  }
}
