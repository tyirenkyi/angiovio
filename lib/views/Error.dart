import 'package:flutter/material.dart';

class Error extends StatefulWidget {
  @override
  _ErrorState createState() => _ErrorState();
}

class _ErrorState extends State<Error> {
  showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('An unexpected error occurred. Please check your connection and try again'),
            backgroundColor: Colors.redAccent,
            duration: Duration(minutes: 1)
        )
    );
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {showSnackBar();});
  }

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
        children: [
          Center(
              child: Container(
                child: Image.asset('assets/images/logo.png'),
                width: 100,
                height: 100,
              )
          ),
        ],
      ),
    );
  }
}
