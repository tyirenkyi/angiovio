import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'Settings.dart';
import 'Dashboard.dart';
import '../services.dart';
import '../providers/drug_provider.dart';


class Home extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _routeIndex = 0;
  FirebaseMessaging _messaging = FirebaseMessaging.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  List<Widget> _routes = [
    Dashboard(),
    Settings(),
  ];
  List<String> _routeNames = [
    'TODAY',
    'SETTINGS'
  ];
  Map<String, dynamic> _newDrug = {
    'user': '',
    'name': '',
    'dosage': 0,
    'interval': 0,
    'missed': 0,
    'taken': 0,
    'repeats': 0
  };
  int _interval = 6;
  bool _loading = false;
  final _form = GlobalKey<FormState>();
  FocusNode _doseFocusNode = FocusNode();
  FocusNode _dropdownFocusNode = FocusNode();

  
  void _onTabItemTapped(int index) {
    setState(() {
      _routeIndex = index;
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

  _saveForm() async {
    final value = _form.currentState!.validate();
    if(!value)
      return false;
    if(_interval == 0) {
      _showSnackBar('Please pick an interval for the drug', Colors.redAccent);
      return false;
    }
    _form.currentState!.save();
    return true;
  }

  _showLoadingIndicator(StateSetter setState) {
    setState(() {
      _loading = true;
    });
  }

  _hideLoadingIndicator(StateSetter setState) {
    setState(() {
      _loading = false;
    });
  }

  _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: color)
    );
  }

  _determineRepeats() {
    switch(_interval) {
      case 6:
        _newDrug['interval'] = _interval;
        _newDrug['repeats'] = 4;
        break;
      case 8:
        _newDrug['interval'] = _interval;
        _newDrug['repeats'] = 3;
        break;
      case 12:
        _newDrug['interval'] = _interval;
        _newDrug['repeats'] = 2;
        break;
      case 24:
        _newDrug['interval'] = _interval;
        _newDrug['repeats'] = 1;
        break;
    }
  }

  _saveRegistrationToken() async{
    String? token = await _messaging.getToken();
    String userId = _auth.currentUser!.uid;
    _newDrug['token'] = token;
    _newDrug['user'] = userId;
  }

  _handleAddDrug(StateSetter setState) async{
    var formStatus = await _saveForm();
    if(!formStatus)
      return;
    _showLoadingIndicator(setState);
    _determineRepeats();
    await _saveRegistrationToken()
      .then((_) async=> {
          await addDrug(_newDrug)
            .then((_) => {
              _hideLoadingIndicator(setState),
              Provider.of<DrugProvider>(context, listen: false).fetchDrugs(user: _newDrug['user']),
              Navigator.pop(context),
              _showSnackBar('Your drug has been successfully added', Colors.green)
            })
            .catchError((error) => {
              _hideLoadingIndicator(setState),
              Navigator.pop(context),
              _showSnackBar('An unexpected error occurred. We are unable to add your drug at this time', Colors.redAccent)
            })
      });
  }

  Widget _buildAddDrugBottomSheet(StateSetter setState) {
    double screenHeight = MediaQuery.of(context).size.height;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
      child: Container(
        height: screenHeight * 0.8,
        decoration: BoxDecoration(
          color: Color.fromRGBO(33, 33, 33, 1)
        ),
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _form,
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
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_doseFocusNode);
                  },
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
                  validator: (value) {
                    if(value!.isEmpty)
                      return 'Please enter the name of the drug';
                    return null;
                  },
                  onSaved: (value) {
                    value = value?.trim();
                    _newDrug['name'] = value;
                  },
                ),
                Padding(padding: EdgeInsets.only(bottom: 15)),
                TextFormField(
                  style: TextStyle(
                    color: Colors.white
                  ),
                  textInputAction: TextInputAction.next,
                  focusNode: _doseFocusNode,
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
                  validator: (value) {
                    if(value!.isEmpty)
                      return 'Please enter the dosage';
                    return null;
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_dropdownFocusNode);
                  },
                  onSaved: (value) {
                    value = value?.trim();
                    _newDrug['dosage'] = value;
                  },
                ),
                Padding(padding: EdgeInsets.only(bottom: 25)),
                Text('Interval', style: TextStyle(fontSize: 16, color: Colors.white),),
                DropdownButton<int>(
                  icon: Icon(Icons.arrow_drop_down),
                  focusNode: _dropdownFocusNode,
                  value: _interval,
                  iconSize: 20,
                  elevation: 5,
                  style: TextStyle(color: Colors.white),
                  underline: Container(
                    height: 2,
                    color: Colors.blue,
                  ),
                  onChanged: (int? newValue) {
                    setState(() {
                      _interval = newValue!;
                    });
                  },
                  items: <int>[6, 8, 12, 24]
                    .map<DropdownMenuItem<int>>((int value) => (
                      DropdownMenuItem<int>(
                        value: value,
                        child: Text('$value hours', style: TextStyle(color: Colors.grey),)
                      )
                  )).toList(),
                ),
                Padding(padding: EdgeInsets.only(bottom: 60)),
                if(_loading)
                  LinearProgressIndicator()
                else
                  ElevatedButton(
                    onPressed: () {_handleAddDrug(setState);},
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
        ),
      ),
    );
  }

  _fetchDrugs() async{
    await Provider.of<DrugProvider>(context, listen: false).fetchDrugs(user: _auth.currentUser!.uid)
      .catchError((_) {
        _showSnackBar('An error occurred. Please check your internet connection.', Colors.redAccent);
      });
  }


  @override
  void initState() {
    _fetchDrugs();
    super.initState();
  }

  @override
  void dispose() {
    _doseFocusNode.dispose();
    _dropdownFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async { return Future.value(false); },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          brightness: Brightness.dark,
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
                _routeNames[_routeIndex],
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
        body: _routes[_routeIndex],
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
          currentIndex: _routeIndex,
          selectedItemColor: Colors.white,
          onTap: _onTabItemTapped,
        ),
        floatingActionButton: _routeIndex == 0 ?FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _showAddDrug,
          backgroundColor: Color.fromRGBO(21, 101, 192, 1),
        ) : null,
      ),
    );
  }
}
