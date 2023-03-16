import 'package:artllery_mobile/features/authentication/screens/forgot_password_screen.dart';
import 'package:artllery_mobile/features/authentication/screens/signup_screen.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/orange_button.dart';

class SigninScreen extends StatefulWidget {

  static const String screenRoute = "/signin";

  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: (screenWidth-screenWidth/1.4)/2),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 6,),
                SizedBox(
                  width: screenWidth/1.4,
                  height: screenHeight/18,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(
                          width: 2,
                        )
                      ),
                        focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        width: 2,
                      )
                  ),)
                  ),
                ),
                SizedBox(height: screenHeight/30,),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 6,),
                SizedBox(
                  width: screenWidth/1.4,
                  height: screenHeight/18,
                  child: TextFormField(
                    obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: const BorderSide(
                              width: 2,
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              width: 2,
                            )
                        ),)
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){return const ForgotPasswordScreen();}));
                    },
                    child: const Text(
                      "Forgot password ?",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight/30,),
                OrangeButton(press: (){}, buttonName: "Signin"),
                SizedBox(height: screenHeight/30,),
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return const SignupScreen();}));
                  },
                  child: const Text(
                    "I do not have an account",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
