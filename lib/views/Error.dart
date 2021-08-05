import 'package:flutter/material.dart';

class Error extends StatefulWidget {
  @override
  _ErrorState createState() => _ErrorState();
}

class _ErrorState extends State<Error> {
  final _scaffold = GlobalKey<ScaffoldState>();

  showSnackBar() {
    _scaffold.currentState?.showSnackBar(
        SnackBar(
            content: Text('An error occurred.'),
            backgroundColor: Colors.redAccent,
            duration: Duration(minutes: 1)
        )
    );
  }

  void initState() {
    super.initState();
    showSnackBar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
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
