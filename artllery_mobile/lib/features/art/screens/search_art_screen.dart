import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchArtScreen extends StatefulWidget {
  const SearchArtScreen({Key? key}) : super(key: key);

  @override
  State<SearchArtScreen> createState() => _SearchArtScreenState();
}

class _SearchArtScreenState extends State<SearchArtScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: true,
        elevation: 2,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Search for art",
              hintStyle: const TextStyle(
                fontSize: 20,
              ),
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  width: 2,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  width: 2,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth / 30,
                  vertical: 10,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, int index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: screenWidth/50),
                  width: screenWidth/4.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.brown.shade200,
                  ),
                  child: const Center(
                    child: Text("Drawings"),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 13,
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("assets/images/tree.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
