import 'dart:ui';

import 'package:flooter/screens/home.dart';
import 'package:flooter/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/image_3.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                  top: MediaQuery.of(context).size.height / 4,
                  right: MediaQuery.of(context).size.width * 0.05,
                  child: Image(image: AssetImage('assets/images/image_1.png'))),
              Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 350),
                    child: GlassmorphicContainer(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width * 0.9,
                        borderRadius: 40,
                        blur: 15,
                        alignment: Alignment.center,
                        border: 0,
                        linearGradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(0.1),
                              Colors.white38.withOpacity(0.1)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
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
                                borderRadius: BorderRadius.circular(40.0),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 20.0,
                                    sigmaY: 20.0,
                                  ),
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 40),
                                              child: Container(
                                                  child: Column(children: [
                                                Text(
                                                  'Explore the Stars',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Red Rose',
                                                      fontSize: 30),
                                                ),
                                              ]))),
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  100,
                                              child: Text(
                                                  'The world of stars is full of wonderful places and beautiful life',
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w200),
                                                  textAlign: TextAlign.center),
                                            ),
                                          ),
                                          Material(
                                            elevation: 0.0,
                                            // borderRadius:
                                            //     BorderRadius
                                            //         .circular(
                                            //             20.0),
                                            // color: Color(
                                            //         0xffBD00FF)
                                            //     .withOpacity(0.6),
                                            color: Colors.transparent,
                                            child: GlassmorphicContainer(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.09,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.7,
                                                borderRadius: 40,
                                                blur: 15,
                                                alignment: Alignment.center,
                                                border: 0,
                                                linearGradient: LinearGradient(
                                                    colors: [
                                                      Color(0xffBD00FF)
                                                          .withOpacity(0.4),
                                                      Color(0xffBD00FF)
                                                          .withOpacity(0.4)
                                                    ],
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight),
                                                borderGradient:
                                                    LinearGradient(colors: [
                                                  Colors.grey.withOpacity(0.15),
                                                  Colors.grey.withOpacity(0.15)
                                                ]),
                                                child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.7,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.09,
                                                    decoration:
                                                        BoxDecoration(boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 16,
                                                        spreadRadius: 16,
                                                        color: Colors.black
                                                            .withOpacity(0.1),
                                                      )
                                                    ]),
                                                    child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(40.0),
                                                        child: BackdropFilter(
                                                            filter: ImageFilter.blur(
                                                              sigmaX: 20.0,
                                                              sigmaY: 20.0,
                                                            ),
                                                            child: MaterialButton(
                                                              onPressed:
                                                                  () async {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                Login()));
                                                              },
                                                              child: const Text(
                                                                'Get Started',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        24,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            )
                                                            //  Material(
                                                            //     elevation: 15.0,
                                                            //     // borderRadius:
                                                            //     //     BorderRadius
                                                            //     //         .circular(
                                                            //     //             20.0),
                                                            //     // color: Color(
                                                            //     //         0xffBD00FF)
                                                            //     //     .withOpacity(0.6),
                                                            //     color: Colors
                                                            //         .transparent,
                                                            //     child:
                                                            )))),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )))),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

// decoration: BoxDecoration(
//                             //   image: DecorationImage(
//                             // image: AssetImage("assets/images/image_3.png"),
//                             // fit: BoxFit.cover,
//                             //)
//                             ),
//                         child: Center(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               // Container(
//                               //     child: Image(
//                               //         image: AssetImage('assets/images/image_1.png'))),
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 350),
//                                 child: SizedBox(
//                                   width:
//                                       MediaQuery.of(context).size.width - 40,
//                                   height: MediaQuery.of(context).size.width /
//                                       1.35,
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                         borderRadius:
//                                             BorderRadius.circular(30.0),
//                                         color: Color(0xffC4C4C4)
//                                             .withOpacity(0.1),
//                                         // elevation: 2.0,

//                                         boxShadow: [
//                                           BoxShadow(
//                                             color:
//                                                 Colors.grey.withOpacity(0.1),
//                                             spreadRadius: 1,
//                                             blurRadius: 1,
//                                             offset: Offset(4,
//                                                 4), // changes position of shadow
//                                           ),
//                                           BoxShadow(
//                                             color: Color(0xffC4C4C4)
//                                                 .withOpacity(0.1),
//                                             spreadRadius: 1,
//                                             blurRadius: 15,
//                                             offset: Offset(-4,
//                                                 -4), // changes position of shadow
//                                           ),
//                                         ]),
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(top: 40),
//                                       child: Container(
//                                         child: Column(
//                                           children: [
//                                             Text(
//                                               'Explore the Stars',
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontFamily: 'Red Rose',
//                                                   fontSize: 28),
//                                             ),
//                                             Padding(
//                                               padding:
//                                                   const EdgeInsets.all(20.0),
//                                               child: Container(
//                                                 width: MediaQuery.of(context)
//                                                         .size
//                                                         .width -
//                                                     100,
//                                                 child: Text(
//                                                     'The world of stars is full of wonderful places and beautiful life',
//                                                     style: TextStyle(
//                                                         fontSize: 20,
//                                                         color: Colors.white,
//                                                         fontWeight:
//                                                             FontWeight.w200),
//                                                     textAlign:
//                                                         TextAlign.center),
//                                               ),
//                                             ),
//                                             Material(
//                                                 elevation: 15.0,
//                                                 borderRadius:
//                                                     BorderRadius.circular(
//                                                         30.0),
//                                                 color: Color(0xffBD00FF)
//                                                     .withOpacity(0.6),
//                                                 child: MaterialButton(
//                                                   minWidth:
//                                                       (MediaQuery.of(context)
//                                                               .size
//                                                               .width -
//                                                           100),
//                                                   height:
//                                                       MediaQuery.of(context)
//                                                               .size
//                                                               .width /
//                                                           5,
//                                                   // padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//                                                   onPressed: () async {},
//                                                   child: const Text(
//                                                     'Fly with Stars',
//                                                     style: TextStyle(
//                                                         color: Colors.white),
//                                                   ),
//                                                 )),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
