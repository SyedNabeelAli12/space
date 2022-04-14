import 'dart:ui';

import 'package:flooter/screens/check.dart';
import 'package:flooter/screens/home.dart';
import 'package:flooter/screens/profile.dart';
import 'package:flooter/screens/search.dart';
import 'package:flooter/screens/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

// String _color = 'Red';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  PageController pageController = PageController();
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    void onTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 1000), curve: Curves.bounceIn);
    }

    // final _themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
        home: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/image_3.png"),
                    fit: BoxFit.cover)),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: PageView(
                controller: pageController,
                children: [
                  Home(),
                  Profile(),
                  HomePage(),
                  Search(),
                  SlideShow()
                ],
              ),
              bottomNavigationBar: GlassmorphicContainer(
                  height: MediaQuery.of(context).size.height * 0.065,
                  width: MediaQuery.of(context).size.width * 0.9,
                  borderRadius: 20,
                  blur: 15,
                  alignment: Alignment.center,
                  border: 0,
                  linearGradient: LinearGradient(colors: [
                    Colors.white.withOpacity(0.1),
                    Colors.white38.withOpacity(0.1)
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderGradient: LinearGradient(colors: [
                    Colors.white24.withOpacity(0.15),
                    Colors.white70.withOpacity(0.15)
                  ]),
                  child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          blurRadius: 16,
                          spreadRadius: 16,
                          color: Colors.black.withOpacity(0.1),
                        )
                      ]),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 20.0,
                              sigmaY: 20.0,
                            ),
                            child: BottomNavigationBar(
                              backgroundColor: Colors.transparent,
                              items: const <BottomNavigationBarItem>[
                                BottomNavigationBarItem(
                                    backgroundColor: Colors.transparent,
                                    icon: Icon(Icons.home_max),
                                    label: 'Home'),
                                BottomNavigationBarItem(
                                    backgroundColor: Colors.transparent,
                                    icon: Icon(
                                      Icons.supervised_user_circle,
                                    ),
                                    label: 'Profile'),
                                BottomNavigationBarItem(
                                    backgroundColor: Colors.transparent,
                                    icon: Icon(Icons.message),
                                    label: 'Message'),
                                BottomNavigationBarItem(
                                    backgroundColor: Colors.transparent,
                                    icon: Icon(Icons.search),
                                    label: 'Search'),
                                BottomNavigationBarItem(
                                    backgroundColor: Colors.transparent,
                                    icon: Icon(Icons.notifications),
                                    label: 'Notification')
                              ],
                              unselectedItemColor: Colors.grey,
                              // unselectedFontSize: 18,
                              selectedItemColor: Color(0xff63219D),
                              selectedFontSize: 10,
                              currentIndex: _selectedIndex,
                              onTap: onTapped,
                            ),
                          )))),
            )));
  }
}
