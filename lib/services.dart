import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;

Map<String, String> headers = {
  'Content-Type': 'application/json;charset=UTF-8',
  'Charset': 'utf-8'
};


class AuthService {
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
  
  checkResponse(response) async{
    if(response.statusCode >= 200 && response.statusCode < 300)
      return response;
    var msg = response.body;
    throw new HttpException(msg);
  }
  
  decodeJson(response) async{
    return await json.decode(response.body);
  }
}