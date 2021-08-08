import 'package:flutter/material.dart';

import '../widgets/SignUpForm.dart';

class SignUp extends StatefulWidget {
  static const routeName = "/signUp";

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async { return Future.value(false); },
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          backgroundColor: Color.fromRGBO(33, 33, 33, 1),
          elevation: 0,
        ),
        backgroundColor: Color.fromRGBO(33, 33, 33, 1),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.only(top: 40),
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  SignUpForm()
                ],
              ),
            ),
          )
      ),
    );
  }
}
