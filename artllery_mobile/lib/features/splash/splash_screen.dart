import 'dart:ui';
import 'package:flutter/material.dart';

import '../../common/constants/colors.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onInitializationComplete;
  const SplashScreen({Key? key, required this.onInitializationComplete})
      : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 6))
        .then((_) => widget.onInitializationComplete());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(),
            Positioned(
              left: -100,
              top: -60,
              child: Container(
                height: 356,
                width: 329,
                decoration: const BoxDecoration(
                    color: AppColors.jungleGreen,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(150),
                        topRight: Radius.circular(200),
                        bottomRight: Radius.circular(150),
                        bottomLeft: Radius.circular(200))),
              ),
            ),
            Positioned(
              top: 350,
              right: -80,
              child: Container(
                height: 272,
                width: 262,
                decoration: BoxDecoration(
                    color: AppColors.jungleGreen,
                    borderRadius: BorderRadius.circular(500)),
              ),
            ),
            const Align(
              alignment: Alignment.center,
                child: Text("Artllery",

                style: TextStyle(
                  fontSize: 80,
                  color: AppColors.orangeShade,
                ),)),
          ],
        ),
      ),
    );
  }
}
