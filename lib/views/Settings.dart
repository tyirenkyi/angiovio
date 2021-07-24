import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jim Halpert',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            Text(
              'jim.halpert@gmail.com',
              style: TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(66, 66, 66, 1)
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            Text(
              '+233 55 402 3245',
              style: TextStyle(
                fontSize: 14,
                  color: Color.fromRGBO(66, 66, 66, 1)
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            Divider(color: Colors.black, thickness: 1.5,),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            Text(
              'Change Password',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            TextFormField(
              style: TextStyle(
                  color: Colors.black
              ),
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  labelText: 'Old Password',
                  labelStyle: TextStyle(
                      fontSize: 16
                  )
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            TextFormField(
              style: TextStyle(
                  color: Colors.black
              ),
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  labelText: 'New Password',
                  labelStyle: TextStyle(
                      fontSize: 16
                  )
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            TextFormField(
              style: TextStyle(
                  color: Colors.black
              ),
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  labelText: 'Verify New Password',
                  labelStyle: TextStyle(
                      fontSize: 16
                  )
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 40)),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'SUBMIT',
                style: TextStyle(fontSize: 18),
              ),
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(400, 45))
              ),
            )
          ],
        ),
      )
    );
  }
}
