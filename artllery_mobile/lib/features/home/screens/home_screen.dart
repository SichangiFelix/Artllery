import 'package:artllery_mobile/features/authentication/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width,),
          Text("Home"),
          ElevatedButton(onPressed: (){
            context.read<AuthService>().logout();
          }, child: Text("Logout")),
        ],
      ),
    );
  }
}
