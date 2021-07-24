import 'package:flutter/material.dart';

//screens
import 'views/Login.dart';
import 'views/SignUp.dart';
import 'views/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.black
      ),
      home: Login(),
      routes: {
        SignUp.routeName: (context) => SignUp(),
        Login.routeName: (context) => Login(),
        Home.routeName: (context) => Home(),
      },
    );
  }
}