import 'package:flutter/material.dart';

import '../../../common/constants/colors.dart';

class SelectedArtScreen extends StatefulWidget {
  const SelectedArtScreen({Key? key}) : super(key: key);

  @override
  State<SelectedArtScreen> createState() => _SelectedArtScreenState();
}

class _SelectedArtScreenState extends State<SelectedArtScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: screenWidth,
                height: screenHeight / 2.4,
                color: Colors.green,
                child: Image.asset("assets/images/tree.png", fit: BoxFit.cover,),
              ),
              Positioned(
                bottom: 10,
                left: screenWidth/40,
                child: const Text("Art Title",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),Positioned(
                bottom: 10,
                right: screenWidth/40,
                child: const Text("2/4",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: screenHeight / 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth/40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Art Title",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "300 Ksh",
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.orangeShade,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight / 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth/40),
            child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )),
          ),
          SizedBox(
            height: screenHeight / 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth/40),
            child: const Text(
              "is simply dummy text of the printing and typesetting industry. Lorem"
              " Ipsum has been the industry's standard dummy te"
              "xt ever since the 1500s, when an unknown printer took a galley",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(
            height: screenHeight / 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth/40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Dimensions",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "20 x 30 cm",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight / 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth/40),
            child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Materials",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )),
          ),
          Expanded(child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: screenWidth/40),
            itemCount: 4,
              itemBuilder: (context, index) => const Text("Material type used",
                style: TextStyle(
                  fontSize: 16,
                ),
              )),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                  width: screenWidth / 3,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Buy",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ))),
              SizedBox(
                  width: screenWidth / 3,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Add to favs",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ))),
            ],
          ),
          SizedBox(
            height: screenHeight / 50,
          ),
        ],
      ),
    );
  }
}
