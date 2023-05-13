import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService{

  AuthService({
    required http.Client client,
    this.baseURL = "http://192.168.56.1:8000"
}): _client = client;

  final String baseURL;
  final http.Client _client;
  String? accessToken;

  Future<String> loginUser({required String username, required String password}) async{

   final _url = Uri.parse('$baseURL/api/token/');

   var data = {
     'username': username,
     'password': password
   };

   var response = await _client.post(_url,
     headers: <String, String>{
       'Content-Type': 'application/json',
     },
    body: jsonEncode(data),
   );

   if (response.statusCode == 200) {
     final SharedPreferences prefs = await  SharedPreferences.getInstance();
     prefs.setString("accessToken", jsonDecode(response.body)["access"]);
     prefs.setString("refreshToken", jsonDecode(response.body)["refresh"]);
     return "User successfully logged in";
   } else {
     throw Exception('Status Code: ${response.statusCode},  body: ${response.body}',);
   }
 }

  Future<String> createUser({required Map<String, String> data}) async{

    final _url = Uri.parse('$baseURL/register/');

    var response = await _client.post(_url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return "User successfully created";
    } else {
      throw Exception('Status Code: ${response.statusCode},  body: ${response.body}',);
    }
  }

  Future<bool> isLoggedIn() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("accessToken") != null;
  }

  Future logout() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("accessToken");
  }

}