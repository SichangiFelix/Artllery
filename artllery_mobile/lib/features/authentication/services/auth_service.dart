import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService{

  Future<bool> setToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', value);
  }
  Future getToken() async{
    final SharedPreferences prefs = await  SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static const String baseURL= "http://192.168.56.1:8000";
  String? accessToken;

 Future<void> loginUser({required String username, required String password}) async{

   final _url = Uri.parse('$baseURL/api/token/');

   var data = {
     'username': username,
     'password': password
   };

   var response = await http.post(_url,
     headers: <String, String>{
       'Content-Type': 'application/json',
     },
    body: jsonEncode(data),
   );

   if (response.statusCode == 200) {
     print(response.statusCode);
     print(jsonDecode(response.body)["access"]);
     final SharedPreferences prefs = await  SharedPreferences.getInstance();
     prefs.setString("token", jsonDecode(response.body)["access"]);
     print(accessToken);
   } else {
     throw Exception('Failed to update data');
   }
 }

  Future<void> createUser({required String username, required String password}) async{

    final _url = Uri.parse('$baseURL/user/');
    var data = {
      'username': "test1",
      'password': "2222",
      'first_name': "Ochux",
      'second_name': "Wafs",
      'email': "chux@gmail.com"
    };

    final SharedPreferences prefs = await  SharedPreferences.getInstance();
    accessToken = prefs.getString('token');

    var response = await http.post(_url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      print(response.body);
      print('user created successfully');
    } else {
      print(response.body);
    }
  }
}