import 'package:flutter/material.dart';

import 'package:angiovio/views/SignUp.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _form = GlobalKey<FormState>();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  Map<String, String> _authData = {
    'email': '',
    'password': ''
  };
  bool loading = false;

  void _saveForm() {}

  void handleSignIn() {}

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 40),
      child: Column(
        children: [
          Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      child: Icon(Icons.email, color: Colors.blue,),
                      padding: EdgeInsets.only(right: 10),
                    ),
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.black
                        ),
                        textInputAction: TextInputAction.next,
                        focusNode: _emailFocusNode,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(167, 192, 205, 1),
                            fontSize: 16
                          ),
                          border: OutlineInputBorder(),
                          fillColor: Color.fromRGBO(167, 192, 205, 1),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue
                            )
                          )
                        ),
                        validator: (value) {
                          if(value!.isEmpty)
                            return 'Please enter your email';
                          if(!value.contains('@') && !value.contains('.'))
                            return 'Please enter a valid email address';
                          return null;
                        },
                        cursorColor: Color.fromRGBO(167, 192, 205, 1),
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_passwordFocusNode);
                        },
                        onSaved: (value) {
                          value = value?.trim();
                          _authData['email'] = value!;
                        },
                      ),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                Row(
                  children: [
                    Container(
                      child: Icon(Icons.lock, color: Colors.blue,),
                      padding: EdgeInsets.only(right: 10),
                    ),
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.black
                        ),
                        obscureText: true,
                        focusNode: _passwordFocusNode,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(167, 192, 205, 1),
                            fontSize: 16
                          ),
                          border: OutlineInputBorder(),
                          fillColor: Color.fromRGBO(167, 192, 205, 1),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue
                            )
                          ),
                        ),
                        validator: (value) {
                          if(value!.isEmpty)
                            return 'Please enter your password';
                          return null;
                        },
                        cursorColor: Color.fromRGBO(167, 192, 205, 1),
                        onSaved: (value) {
                          value = value?.trim();
                          _authData['password'] = value!;
                        },
                        onFieldSubmitted: (_) {
                          _saveForm();
                        },
                      ),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                if(loading)
                  CircularProgressIndicator()
                else
                  ButtonTheme(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                    ),
                    buttonColor: Colors.grey,
                    child: ElevatedButton(
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        handleSignIn();
                      },
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(400, 45))
                      ),
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.all(2)),
                          textStyle: MaterialStateProperty.all(TextStyle(
                              fontWeight: FontWeight.w500
                          ))
                      ),
                      onPressed: () {},
                      child: Text('Forgot Password'),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                ButtonTheme(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: OutlinedButton(
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(BorderSide(
                        color: Colors.lightBlueAccent
                      )),
                      minimumSize: MaterialStateProperty.all(Size(400, 45))
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, SignUp.routeName);
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                  ),
                )
              ],
            )
          )
        ],
      ),
    );
  }
}
