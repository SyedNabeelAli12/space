import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Widget _glassWidget(Container _container, size1, size2) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: GlassmorphicContainer(
          height: size1,
          width: size2,
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
                      child: _container)))),
    );
  }

  Widget _listViewContent(width, height) {
    return _glassWidget(
      Container(
        child: Row(
          children: [
            Container(
              width: 150,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 40),
                child: Column(
                  children: [
                    Text(
                      'Fly with Stars',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Red Rose',
                          fontSize: 26),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Material(
                      elevation: 0.0,
                      color: Colors.transparent,
                      child: GlassmorphicContainer(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.7,
                          borderRadius: 20,
                          blur: 15,
                          alignment: Alignment.center,
                          border: 0,
                          linearGradient: LinearGradient(
                              colors: [
                                Color(0xffBD00FF).withOpacity(0.4),
                                Color(0xffBD00FF).withOpacity(0.4)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          borderGradient: LinearGradient(colors: [
                            Colors.grey.withOpacity(0.15),
                            Colors.grey.withOpacity(0.15)
                          ]),
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: MediaQuery.of(context).size.height * 0.09,
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
                                      child: MaterialButton(
                                        onPressed: () async {},
                                        child: const Text(
                                          'Fly',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              letterSpacing: 6),
                                        ),
                                      ))))),
                    ),
                  ],
                ),
              ),
            ),
            Image(image: AssetImage('assets/images/vr.png'))
          ],
        ),
      ),
      height * 0.250,
      width * 0.9,
    );
  }

////////////
  ///
  ///
  ///
  ///
  ///
  TextEditingController searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Container(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _glassWidget(
              Container(
                  child: Container(
                width: width * 0.85,
                height: height * 0.05,
                child: TextField(
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300),
                    decoration: new InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 216, 189, 240),
                            width: 1.0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.white),
                      suffixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    textAlign: TextAlign.start),
              )),
              MediaQuery.of(context).size.height * 0.065,
              MediaQuery.of(context).size.width * 0.9,
            ),
          )),
          SingleChildScrollView(
            child: Container(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  _listViewContent(width, height),
                  _listViewContent(width, height),
                  _listViewContent(width, height),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
