import 'package:flutter/material.dart';

class OrangeButton extends StatelessWidget {
  VoidCallback press;
  String buttonName;

  OrangeButton({
    required this.buttonName,
    required this.press,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        width: screenWidth / 1.4,
        height: screenHeight / 18,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          onPressed: press,
          child: Text(
            buttonName,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ));
  }
}
