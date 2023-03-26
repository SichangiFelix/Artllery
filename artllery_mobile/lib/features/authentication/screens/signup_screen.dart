import 'package:artllery_mobile/features/authentication/screens/signin_screen.dart';
import 'package:artllery_mobile/features/authentication/services/auth_service.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/orange_button.dart';

class SignupScreen extends StatefulWidget {

  static const String screenRoute = "/signup";

  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController fNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController fPasswordController = TextEditingController();
  TextEditingController sPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: (screenWidth-screenWidth/1.4)/2),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight/12,
                  ),
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
                    height: screenHeight/13,
                    child: TextFormField(
                        controller: fNameController,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Please enter your first name";
                        }
                      },
                        decoration: InputDecoration(
                          helperText: "",
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
                          ),
                        )
                    ),
                  ) ,
                  SizedBox(height: screenHeight/100,),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Username",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6,),
                  SizedBox(
                    width: screenWidth/1.4,
                    height: screenHeight/13,
                    child: TextFormField(
                        controller: usernameController,
                        validator: (value){
                          if(value!.isEmpty){
                            return "Please enter your second name";
                          }
                        },
                        decoration: InputDecoration(
                          helperText: "",
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
                  SizedBox(height: screenHeight/100,),
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
                    height: screenHeight/13,
                    child: TextFormField(
                      controller: emailController,
                        validator: (value){
                          if(value!.isEmpty){
                            return "Please enter your email";
                          }
                        },
                        decoration: InputDecoration(
                          helperText: "",
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
                  SizedBox(height: screenHeight/100,),
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
                    height: screenHeight/13,
                    child: TextFormField(
                      controller: fPasswordController,
                        validator: (value){
                          if(value!.isEmpty){
                            return "You have to provide a password";
                          }else if(value!.length < 8){
                            return "Your password must be 8 or more characters long";
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          helperText: "",
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
                  SizedBox(height: screenHeight/100,),
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
                    height: screenHeight/13,
                    child: TextFormField(
                      controller: sPasswordController,
                        validator: (value){
                          if(value!.isEmpty){
                            return "Please confirm your password";
                          }else if(value.length < 8){
                            return "Your password should be 8 or more characters long";
                          }else if(value != fPasswordController.text){
                            return "The two passwords must match!";
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          helperText: "",
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
                  SizedBox(height: screenHeight/100,)  ,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    const Text(
                      "I agree with the terms and conditions",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Checkbox(value: false, onChanged: (val){}),
                  ],),
                  SizedBox(height: screenHeight/60,),
                  OrangeButton(press: (){
                    if(formKey.currentState!.validate()){

                      var signUpData = {
                        "first_name": fNameController.text,
                        "username": usernameController.text,
                        "email": emailController.text,
                        "password": sPasswordController.text,
                      };
                      AuthService().createUser(data: signUpData);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You have successfully created an account")));
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SigninScreen()));
                    }
                  }, buttonName: "Signup"),
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
      ),
    );
  }
}
