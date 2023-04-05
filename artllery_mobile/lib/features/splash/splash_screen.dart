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

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{

  late Animation<Offset> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = Tween<Offset>(begin: Offset.zero, end: const Offset(-1.5,0.5)).animate(CurvedAnimation(parent: controller, curve: Curves.bounceInOut))
      ..addStatusListener((status){
        if (status == AnimationStatus.completed) {
          controller.reverse();
               } else if (status == AnimationStatus.dismissed) {
                  controller.forward();
               }
      });
    controller.forward();

    Future.delayed(const Duration(seconds: 6))
        .then((_) => widget.onInitializationComplete());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [AppColors.jungleGreen, Theme.of(context).scaffoldBackgroundColor],
                    stops: [0.9, 1.0],
                  ),
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
              child: SlideTransition(
                position: animation,
                child: Container(
                  height: 272,
                  width: 262,
                  decoration: BoxDecoration(
                      gradient: RadialGradient(
                        colors: [AppColors.jungleGreen, Theme.of(context).scaffoldBackgroundColor],
                        stops: [0.9, 1.0],
                      ),
                      color: AppColors.jungleGreen,
                      borderRadius: BorderRadius.circular(500)),
                ),
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
