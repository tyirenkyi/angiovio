import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
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
              'Jim Halpert',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            Text(
              'jim.halpert@gmail.com',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            Text(
              '+233 55 402 3245',
              style: TextStyle(
                fontSize: 14,
                  color: Colors.grey
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            Divider(color: Colors.white, thickness: 1.5,),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            Text(
              'Change Password',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            TextFormField(
              style: TextStyle(
                  color: Colors.white
              ),
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  labelText: 'Old Password',
                  labelStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white
                  ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.white
                  )
                )
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            TextFormField(
              style: TextStyle(
                color: Colors.white
              ),
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  labelText: 'New Password',
                  labelStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white
                  ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 1
                  )
                )
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            TextFormField(
              style: TextStyle(
                  color: Colors.white
              ),
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  labelText: 'Verify New Password',
                  labelStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white
                  ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 1
                  )
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
