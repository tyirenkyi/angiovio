import 'package:flutter/material.dart';

import '../widgets/LoginForm.dart';

class Login extends StatefulWidget {

  static const routeName = '/login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 33, 33, 1),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 80),
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
              LoginForm()
            ],
          ),
        ),
      )
    );
  }
}
