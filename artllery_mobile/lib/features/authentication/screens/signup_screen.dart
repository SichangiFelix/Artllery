import 'package:artllery_mobile/features/authentication/screens/signin_screen.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/OrangeButton.dart';

class SignupScreen extends StatefulWidget {

  static const String screenRoute = "/signup";

  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
                    "First Name",
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
                SizedBox(height: screenHeight/60,),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Second Name",
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
                SizedBox(height: screenHeight/60,),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 24,
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
                SizedBox(height: screenHeight/60,),
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
                SizedBox(height: screenHeight/60,),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Confirm Password",
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
                SizedBox(height: screenHeight/60,) ,
                const Text(
                  "I agree with the terms and conditions",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: screenHeight/60,),
                OrangeButton(press: (){}, buttonName: "Signup"),
                SizedBox(height: screenHeight/60,),
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return SigninScreen();}));
                  },
                  child: const Text(
                    "I already have an account",
                    style: TextStyle(
                      fontSize: 14,
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
