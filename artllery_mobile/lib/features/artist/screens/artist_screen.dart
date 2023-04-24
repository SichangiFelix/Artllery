import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ArtistScreen extends StatefulWidget {
  const ArtistScreen({Key? key}) : super(key: key);

  @override
  State<ArtistScreen> createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: screenHeight/80,),
            CircleAvatar(
              radius: screenHeight / 14,
            ),
            SizedBox(height: screenHeight/50,),
            const Text("Artist Name",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth/30),
              child: const Divider(
                thickness: 2,
              ),
            ),
            SizedBox(height: screenHeight/60,),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: screenWidth/30, vertical: screenHeight/50),
                gridDelegate: SliverWovenGridDelegate.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  pattern: [
                    const WovenGridTile(
                        0.95,
                        crossAxisRatio: 0.95,
                    ),
                    const WovenGridTile(
                      0.7,
                      crossAxisRatio: 0.9,
                      alignment: AlignmentDirectional.centerEnd,
                    ),
                  ],
                ),
                itemCount: 8,
                itemBuilder: (context, index) => Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                      child: Image.asset("assets/images/tree.png", fit: BoxFit.cover,)) ,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
