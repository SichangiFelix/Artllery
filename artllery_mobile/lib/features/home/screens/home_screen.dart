import 'package:artllery_mobile/features/authentication/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../art/screens/search_art_screen.dart';
import '../../art/screens/selected_art.dart';
import '../../artist/screens/artist_screen.dart';
import '../components/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 1;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Artllery"),
      ),
      drawer: const AppDrawer(),
      body: IndexedStack(
        index: pageIndex,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
              ),
              const Text("Home"),
              ElevatedButton(
                  onPressed: () {
                    context.read<AuthService>().logout();
                  },
                  child: const Text("Logout")),
            ],
          ),
          Column(
            children: [
              SizedBox(height: screenHeight/80,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchArtScreen()));
                },
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                      ),
                    ),
                  ),
                  margin: EdgeInsets.symmetric(
                      horizontal: (screenWidth - screenWidth / 1.15) / 2),
                  height: screenHeight / 20,
                  width: screenWidth / 1.15,
                  child: const Center(
                    child: Text("Search for art",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight/50,),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: (screenWidth - screenWidth / 1.15) / 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "Top Art",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SelectedArtScreen()));
                      },
                      child: const Text(
                        "More",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: (screenWidth - screenWidth / 1.15) / 2),
                child: const Divider(
                  thickness: 2,
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight/100,
                      horizontal: (screenWidth - screenWidth / 1.15) / 2),
                  itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: screenWidth/12,
                      mainAxisSpacing: screenHeight/60,
                        crossAxisCount: 2),
                    itemBuilder: (context, int index) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset("assets/images/cloud.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
              ),
              SizedBox(height: screenHeight/50,),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: (screenWidth - screenWidth / 1.15) / 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      "Top Artists",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "",
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: (screenWidth - screenWidth / 1.15) / 2),
                child: const Divider(
                  thickness: 2,
                ),
              ),
              SizedBox(
                height: screenHeight / 6.5,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth / 30,
                    vertical: 10,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, int index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth / 40),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const ArtistScreen(),
                        ));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            foregroundImage: const AssetImage("assets/images/user.png"),
                            radius: screenHeight / 24,
                          ),
                          const Text("Picaso Picaso",
                            style: TextStyle(
                              fontSize: 18,

                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const Center(
            child: Text("TEST"),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline), label: "Gallery"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
        ],
      ),
    );
  }
}
