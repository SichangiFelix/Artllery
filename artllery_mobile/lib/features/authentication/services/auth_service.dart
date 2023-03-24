import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService{

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
     final SharedPreferences prefs = await  SharedPreferences.getInstance();
     prefs.setString("accessToken", jsonDecode(response.body)["access"]);
     prefs.setString("refreshToken", jsonDecode(response.body)["refresh"]);
   } else {
     throw Exception('Failed to login');
   }
 }

  Future<void> createUser({required Map<String, String> data}) async{

    final _url = Uri.parse('$baseURL/register/');

    var response = await http.post(_url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      throw Exception("Could not create user");
    }
  }

  Future<bool> isLoggedIn() async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();

   if(prefs.getString("accessToken") != null){
     return true;
   }else{
     return false;
   }
  }

}