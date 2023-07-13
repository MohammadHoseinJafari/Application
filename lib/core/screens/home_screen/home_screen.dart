import 'package:amaj/core/screens/home_screen/home_model.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:amaj/core/screens/home_screen/ai.dart';
import 'package:amaj/core/screens/home_screen/dashboard.dart';
import 'package:amaj/core/screens/home_screen/saved.dart';
import 'package:amaj/core/screens/home_screen/search.dart';
import 'package:amaj/core/screens/home_screen/main_page.dart';

class MyNavigationBar extends StatefulWidget {
  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 2;
  NavBarModel get model => Provider.of<NavBarModel>(context, listen: false);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        height: 75,
        backgroundColor: Color(0xFF222A3B),
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Icon(CupertinoIcons.person,color: Colors.white),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Image(image: AssetImage(("assets/icons/ai.png"))),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 14),
              child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFF4500),
                        borderRadius: BorderRadius.circular(50), // Border radius
                        border: Border.all(color: Colors.white , width: 1)
                      ),
                      padding: EdgeInsets.all(10), // Padding inside the container
                      child: Image(image: AssetImage(("assets/icons/home.png")))
                  ),
                ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Icon(CupertinoIcons.search,color: Colors.white),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Icon(CupertinoIcons.bookmark ,color: Colors.white),
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return UserPage();
          case 1:
            return BrainPage();
          case 2:
            return HomeScreen();
          case 3:
            return SearchPage();
          case 4:
            return SavedPage();
          default:
            return Container();
        }
      },
    );
  }
}