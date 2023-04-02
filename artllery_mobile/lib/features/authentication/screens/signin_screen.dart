import 'package:artllery_mobile/features/authentication/bloc/login_event.dart';
import 'package:artllery_mobile/features/authentication/screens/forgot_password_screen.dart';
import 'package:artllery_mobile/features/authentication/screens/signup_screen.dart';
import 'package:artllery_mobile/features/authentication/services/auth_service.dart';
import 'package:artllery_mobile/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/orange_button.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_state.dart';

class SigninScreen extends StatefulWidget {
  static const String screenRoute = "/signin";

  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => LoginBloc(
              authService: context.read<AuthService>(),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: (screenWidth - screenWidth / 1.4) / 2),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Username",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    width: screenWidth / 1.4,
                    height: screenHeight / 13,
                    child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter a username";
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        controller: usernameController,
                        decoration: InputDecoration(
                          helperText: "",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: const BorderSide(
                                width: 2,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                width: 2,
                              )),
                        )),
                  ),
                  SizedBox(
                    height: screenHeight / 30,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    width: screenWidth / 1.4,
                    height: screenHeight / 13,
                    child: TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your password to continue";
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          helperText: "",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: const BorderSide(
                                width: 2,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                width: 2,
                              )),
                        )),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const ForgotPasswordScreen();
                        }));
                      },
                      child: const Text(
                        "Forgot password ?",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight / 30,
                  ),
                  BlocBuilder<LoginBloc, LoginState>(builder: (context, state){
                    return state is LoginSubmittingState ? const CircularProgressIndicator() : OrangeButton(
                        press: () {
                          if (formKey.currentState!.validate()) {

                            context.read<LoginBloc>().add(LoginSubmittedEvent(username: usernameController.text, password: passwordController.text));

                            if(state is LoginSuccessState){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(context.read<LoginBloc>().feedbackMessage),));
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return const HomeScreen();
                              }));
                            }
                            else if(state is LoginFailedState){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(context.read<LoginBloc>().exceptionMessage),));
                            }
                          }
                        },
                        buttonName: "Signin");
                  }),
                  SizedBox(
                    height: screenHeight / 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return const SignupScreen();
                      }));
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
      ),
    );
  }
}
