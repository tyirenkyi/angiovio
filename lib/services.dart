import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

import './lists/DrugList.dart';

Map<String, String> headers = {
  'Content-Type': 'application/json;charset=UTF-8',
  'Charset': 'utf-8'
};


class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future signUp({
    required Map<String, String> form
  }) async {
    try {
      form['phoneNumber'] = '+233' + form['phoneNumber']!.substring(1, form['phoneNumber']!.length);
      await http.post(Uri.parse('https://angiovio-server-3wyik.ondigitalocean.app/api/signup'),
          body: jsonEncode(form), headers: headers)
            .then(checkResponse)
            .then(decodeJson);
    } catch(e) {
      print(e);
      throw e;
    }
  }

  Future signIn({
    required Map<String, String> form
  }) async {
    User user;
    try {
      user = (await _firebaseAuth.signInWithEmailAndPassword(email: form['email']!, password: form['password']!)).user!;
      return 'SUCCESS';
    } on FirebaseAuthException catch(e) {
      return e.code;
    }
  }

}

checkResponse(response) async{
  if(response.statusCode >= 200 && response.statusCode < 300)
    return response;
  var msg = response.body;
  throw new HttpException(msg);
}

decodeJson(response) async{
  return await json.decode(response.body);
}

Future loadDrugs({required user, required drug}) async {
  try {
    final response = await http.get(Uri.parse('https://angiovio-server-3wyik.ondigitalocean.app/api/drug/$user/$drug'))
        .then(checkResponse)
        .then(decodeJson);
    return DrugList.fromJson(response);
  } catch(e) {
    throw e;
  }
}

Future addDrug(Map<String, dynamic> newDrug) async {
  try {
    await http.post(Uri.parse('https://angiovio-server-3wyik.ondigitalocean.app/api/adddrug'),
      body: jsonEncode(newDrug), headers: headers)
        .then(checkResponse)
        .then(decodeJson);
  } catch(e) {
    throw e;
  }
}

Future takeDrug(Map<String, String> drug) async {
  try {
    await http.put(Uri.parse('https://angiovio-server-3wyik.ondigitalocean.app/api/takedrug'),
      body: jsonEncode(drug), headers: headers)
        .then(checkResponse)
        .then(decodeJson);
  } catch(e) {
    throw e;
  }
}

Future deleteDrug(Map<String, String> drug) async {
  try {
    await http.delete(Uri.parse('https://angiovio-server-3wyik.ondigitalocean.app/api/drug'),
      body: jsonEncode(drug), headers: headers)
        .then(checkResponse)
        .then(decodeJson);
  } catch(e) {
    throw e;
  }
}
