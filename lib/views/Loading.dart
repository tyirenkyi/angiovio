import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Image.asset('assets/images/logo.png'),
          width: 100,
          height: 100,
        ),
        LinearProgressIndicator()
      ],
    );
  }
}
