import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Color.fromRGBO(33, 33, 33, 1),
        elevation: 0,
      ),
      backgroundColor: Color.fromRGBO(33, 33, 33, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Image.asset('assets/images/logo.png'),
            width: 100,
            height: 100,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: LinearProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
