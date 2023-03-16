import 'package:http/http.dart' as http;
import 'dart:convert';
class LoginService{

  static const String baseURL= "http://127.0.0.1:8000";
  final _url = Uri.parse('$baseURL/api/token/');

 loginUser({required String username, required String password}) async{

   print(username);
   print(password);

   var body = {
     'username': username,
     'password': password
   };

   var result = await http.post(_url,
    body: body,
   ).then((value) {
     print(value);
   });

print(result.statusCode);
   if(result.statusCode == 200){
     print(result.body);
     return jsonDecode(result.body);
   }

 }

}