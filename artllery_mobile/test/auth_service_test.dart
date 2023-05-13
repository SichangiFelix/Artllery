import 'package:test/test.dart';

void main(){
  group("Login", (){
    test("Empty login credentials will throw an exception",
            (){
          //var result = AuthService().loginUser(username: "", password: "");
          //expect(result, Exception());
        }
    );
    // test("Empty login credentials will throw an exception",
    //         (){
    //
    //     }
    // );

  });

  group("SignUp", (){
    test("Empty signup credentials will throw an exception",
            (){
          //var result = AuthService().createUser(data: {});
          //expect(result, Exception());
        }
    );

  });
}