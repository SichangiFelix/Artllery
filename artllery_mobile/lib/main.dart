import 'package:artllery_mobile/features/authentication/bloc/login_bloc.dart';
import 'package:artllery_mobile/features/authentication/bloc/login_event.dart';
import 'package:artllery_mobile/features/authentication/screens/signin_screen.dart';
import 'package:artllery_mobile/features/authentication/services/auth_service.dart';
import 'package:artllery_mobile/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'features/authentication/bloc/login_state.dart';
import 'features/splash/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(SplashScreen(key:UniqueKey(),onInitializationComplete: ()=>runApp(MyApp())));
}


class MyApp extends StatefulWidget {


  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  http.Client client = http.Client();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => AuthService(client:  client),
    child: BlocProvider<LoginBloc>(
    create: (context) => LoginBloc(
    authService: context.read<AuthService>(),
    ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state){
            context.read<LoginBloc>().add(CheckToken());
            return state is LoggedIn ? const HomeScreen() : const SigninScreen();
          },
        ),
      ),
    ),
    );
  }
}