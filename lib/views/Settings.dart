import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Login.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  _signOut() async{
    await _firebaseAuth.signOut();
    Navigator.pushReplacementNamed(context, Login.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(33, 33, 33, 1)
        ),
        padding: EdgeInsets.only(top: 10, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _firebaseAuth.currentUser!.displayName!,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            Text(
              '${_firebaseAuth.currentUser!.email}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            Text(
              '${_firebaseAuth.currentUser!.phoneNumber}',
              style: TextStyle(
                fontSize: 14,
                  color: Colors.grey
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            Divider(color: Colors.white, thickness: 1.5,),
            TextButton(
              child: Row(
                children: [
                  Icon(Icons.logout, color: Colors.white,),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                  Text(
                    'Sign Out',
                    style: TextStyle(
                      fontSize: 16
                    ),
                  )
                ],
              ),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero)
              ),
              onPressed: _signOut,
            )
          ],
        ),
      )
    );
  }
}
