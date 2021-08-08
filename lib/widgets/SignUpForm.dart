import 'package:flutter/material.dart';

import '../services.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();
  final _passwordController = TextEditingController();
  final _form = GlobalKey<FormState>();
  Map<String, String> _authData = {
    'displayName': '',
    'email': '',
    'phoneNumber': '',
    'password': '',

  };
  bool loading = false;


  @override
  void dispose() {
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _phoneFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }
  
  handleSignUp() async{
    if(_form.currentState!.validate()) {
      _form.currentState!.save();
      setState(() {
        loading = true;
      });
      try {
        await AuthService().signUp(form: _authData);
        setState(() {
          loading = false;
        });
        showSuccessSnackBar();
      } catch(e) {
        setState(() {
          loading = false;
        });
        showErrorSnackBar();
      }
    }
  }
  
  showErrorSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('An unexpected error occurred. Please try again later'),
        backgroundColor: Colors.redAccent,)
    );
  }

  showSuccessSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Your account has been created successfully.'),
        backgroundColor: Colors.green,
        action: SnackBarAction(
            label: 'Login',
            onPressed: openLogin
        ),
      )
    );
  }

  openLogin() {
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Form(
            key: _form,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      child: Icon(Icons.person, color: Colors.blue,),
                      padding: EdgeInsets.only(right: 10),
                    ),
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.black
                        ),
                        textInputAction: TextInputAction.next,
                        focusNode: _nameFocusNode,
                        decoration: InputDecoration(
                          labelText: 'Name',
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
                            return 'Please enter your name';
                          if(value.length < 4)
                            return 'Please enter your full name';
                          return null;
                        },
                        cursorColor: Color.fromRGBO(167, 192, 205, 1),
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_emailFocusNode);
                        },
                        onSaved: (value) {
                          value = value!.trim();
                          _authData['displayName'] = value;
                        },
                      ),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
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
                          FocusScope.of(context).requestFocus(_phoneFocusNode);
                        },
                        onSaved: (value) {
                          value = value!.trim();
                          _authData['email'] = value;
                        },
                      ),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Row(
                  children: <Widget>[
                    Container(
                      child: Icon(Icons.phone, color: Colors.blue,),
                      padding: const EdgeInsets.only(right: 10),
                    ),
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(
                            color: Colors.black
                        ),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        focusNode: _phoneFocusNode,
                        decoration: const InputDecoration(
                          labelText: 'Phone',
                          labelStyle: TextStyle(
                              color: Color.fromRGBO(167, 192, 205, 1),
                              fontSize: 16
                          ),
                          border: OutlineInputBorder(),
                          fillColor: Color.fromRGBO(167, 192, 205, 1),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:  Colors.blue
                              )
                          ),

                        ),
                        maxLength: 10,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your phone';
                          }
                          if (!value.contains('0') && value.length != 10) {
                            return 'Please enter a valid phone number';
                          }
                          return null;
                        },
                        cursorColor: Color.fromRGBO(167, 192, 205, 1),
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_passwordFocusNode);
                        },
                        onSaved: (value) {
                          value = value!.trim();
                          _authData['phoneNumber'] = value;
                        },
                      ),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Row(
                  children: <Widget>[
                    Container(
                      child: Icon(Icons.lock, color: Colors.blue,),
                      padding: const EdgeInsets.only(right: 10),
                    ),
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(
                            color: Colors.black
                        ),
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                        focusNode: _passwordFocusNode,
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              color: Color.fromRGBO(167, 192, 205, 1),
                              fontSize: 16
                          ),
                          border: OutlineInputBorder(),
                          fillColor: Color.fromRGBO(167, 192, 205, 1),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:  Colors.blue
                              )
                          ),

                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a password';
                          }
                          if (value.length == 8) {
                            return 'Your password is too short';
                          }

                          return null;
                        },
                        cursorColor: Color.fromRGBO(167, 192, 205, 1),
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_confirmPasswordFocusNode);
                        },
                        onSaved: (value) {
                          value = value!.trim();
                          _authData['password'] = value;
                        },
                      ),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(right: 10, left: 25),
                    ),
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(
                            color: Colors.black
                        ),
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                        focusNode: _confirmPasswordFocusNode,
                        decoration: const InputDecoration(
                          labelText: 'Confirm Password',
                          labelStyle: TextStyle(
                              color: Color.fromRGBO(167, 192, 205, 1),
                              fontSize: 16
                          ),
                          border: OutlineInputBorder(),
                          fillColor: Color.fromRGBO(167, 192, 205, 1),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:  Colors.blue
                              )
                          ),

                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != _passwordController.text) {
                            return 'Password fields don\'t match';
                          }

                          return null;
                        },
                        cursorColor: Color.fromRGBO(167, 192, 205, 1),
                        onFieldSubmitted: (_) {
                          handleSignUp();
                        },
                      ),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 30),),
                if(loading)
                  LinearProgressIndicator()
                else
                  ButtonTheme(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                    ),
                    buttonColor: Colors.grey,
                    child: ElevatedButton(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: handleSignUp,
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(400, 45))
                      ),
                    ),
                  ),
                Padding(padding: EdgeInsets.only(bottom: 20),),
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
                    onPressed: openLogin,
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 18
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 100),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
