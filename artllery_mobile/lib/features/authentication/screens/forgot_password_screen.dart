import 'package:artllery_mobile/features/authentication/screens/signup_screen.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/OrangeButton.dart';

class ForgotPasswordScreen extends StatefulWidget {

  static const String screenRoute = "/forgot_password";

  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return const SignupScreen();}));
                  },
                  child: const Text(
                    "Please enter your account email",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight/30,),
                OrangeButton(press: (){}, buttonName: "Change Password"),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
