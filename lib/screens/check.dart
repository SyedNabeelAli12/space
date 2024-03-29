// import 'dart:ui';

// import 'package:flooter/screens/home.dart';
// import 'package:flooter/screens/search.dart';
// import 'package:flutter/material.dart';
// import 'package:glassmorphism/glassmorphism.dart';

// String _color = 'Red';

// class Interfacetheme extends StatefulWidget {
//   const Interfacetheme({Key? key}) : super(key: key);

//   @override
//   _InterfacethemeState createState() => _InterfacethemeState();
// }

// class _InterfacethemeState extends State<Interfacetheme> {
//   Widget switches(IconData icon, String value) {
//     return Column(
//       children: [
//         SizedBox(height: 10),
//         GestureDetector(
//           onTap: () => setState(() => _color = value),
//           child: Container(
//               height: 100,
//               // width: 100,
//               // color: _value == 0 ? Colors.grey : Colors.transparent,
//               margin: const EdgeInsets.all(15.0),
//               padding: const EdgeInsets.all(3.0),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5.0),
//                   color: Colors.transparent,
//                   border: Border.all(
//                       color:
//                           _color == value ? Colors.purple : Colors.transparent,
//                       width: 3)),
//               child: Icon(
//                 icon,
//                 color: _color == value ? Colors.purple : Colors.grey,
//               )),
//         ),
//       ],
//     );
//   }

//   PageController pageController = PageController();
//   int _selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     void onTapped(int index) {
//       setState(() {
//         _selectedIndex = index;
//       });
//       pageController.animateToPage(index,
//           duration: Duration(milliseconds: 1000), curve: Curves.bounceIn);
//     }

//     // final _themeNotifier = Provider.of<ThemeNotifier>(context);
//     return MaterialApp(
//         home: Container(
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage("assets/images/image_3.png"),
//                     fit: BoxFit.cover)),
//             child: Scaffold(
//               backgroundColor: Colors.transparent,
//               body: PageView(
//                 controller: pageController,
//                 children: [Search(), Home(), Search()],
//               ),
//               bottomNavigationBar: GlassmorphicContainer(
//                   height: MediaQuery.of(context).size.height * 0.065,
//                   width: MediaQuery.of(context).size.width * 0.9,
//                   borderRadius: 20,
//                   blur: 15,
//                   alignment: Alignment.center,
//                   border: 0,
//                   linearGradient: LinearGradient(colors: [
//                     Colors.white.withOpacity(0.1),
//                     Colors.white38.withOpacity(0.1)
//                   ], begin: Alignment.topLeft, end: Alignment.bottomRight),
//                   borderGradient: LinearGradient(colors: [
//                     Colors.white24.withOpacity(0.15),
//                     Colors.white70.withOpacity(0.15)
//                   ]),
//                   child: Container(
//                       decoration: BoxDecoration(boxShadow: [
//                         BoxShadow(
//                           blurRadius: 16,
//                           spreadRadius: 16,
//                           color: Colors.black.withOpacity(0.1),
//                         )
//                       ]),
//                       child: ClipRRect(
//                           borderRadius: BorderRadius.circular(20.0),
//                           child: BackdropFilter(
//                             filter: ImageFilter.blur(
//                               sigmaX: 20.0,
//                               sigmaY: 20.0,
//                             ),
//                             child: BottomNavigationBar(
//                               backgroundColor: Colors.transparent,
//                               items: const <BottomNavigationBarItem>[
//                                 BottomNavigationBarItem(
//                                     backgroundColor: Colors.transparent,
//                                     icon: Icon(
//                                       Icons.send,
//                                     ),
//                                     label: 'Send'),
//                                 BottomNavigationBarItem(
//                                     backgroundColor: Colors.transparent,
//                                     icon: Icon(Icons.message),
//                                     label: 'Message'),
//                                 BottomNavigationBarItem(
//                                     backgroundColor: Colors.transparent,
//                                     icon: Icon(Icons.home_max),
//                                     label: 'Home'),
//                                 BottomNavigationBarItem(
//                                     backgroundColor: Colors.transparent,
//                                     icon: Icon(Icons.search),
//                                     label: 'Search'),
//                                 BottomNavigationBarItem(
//                                     backgroundColor: Colors.transparent,
//                                     icon: Icon(Icons.notifications),
//                                     label: 'Notification')
//                               ],
//                               unselectedItemColor: Colors.grey,
//                               // unselectedFontSize: 18,
//                               selectedItemColor: Color(0xff63219D),
//                               selectedFontSize: 10,
//                               currentIndex: _selectedIndex,
//                               onTap: onTapped,
//                             ),
//                           )))),
//             )));
//   }
// }

// import 'dart:ui';

// import 'package:flooter/splash.dart';
// import 'package:flutter/material.dart';
// import 'package:glassmorphism/glassmorphism.dart';

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   String _color = 'Red';
//   Widget switches(IconData icon, String value) {
//     return Column(
//       children: [
//         SizedBox(height: 10),
//         GestureDetector(
//           onTap: () => {setState(() => _color = value), print(value)},
//           child: Container(
//               // height: 100,
//               // width: 100,
//               // color: _value == 0 ? Colors.grey : Colors.transparent,
//               // margin: const EdgeInsets.all(15.0),
//               padding: const EdgeInsets.all(10.0),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20.0),
//                   color: Colors.transparent,
//                   border: Border.all(
//                       color: _color == value
//                           // ? Color(0xffBD00FF)
//                           ? Color(0xff63219D)
//                           : Colors.transparent,
//                       width: 3)),
//               child: Icon(
//                 icon,
//                 color: _color == value ? Color(0xffBD00FF) : Colors.grey,
//               )),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: SizedBox(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage("assets/images/image_3.png"),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(
//                     top: 20.0, left: 15, right: 15, bottom: 10),
//                 child: Container(
//                   child: Row(
//                     children: [
//                       CircleAvatar(
//                         maxRadius: 25,
//                         backgroundImage: AssetImage("assets/images/my.png"),
//                         backgroundColor: Color(0xff63219D).withOpacity(0.4),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           children: [
//                             Text(
//                               'Nabeel Ali',
//                               style: TextStyle(color: Colors.white),
//                             ),
//                             SizedBox(
//                               height:
//                                   MediaQuery.of(context).size.height * 0.015,
//                             ),
//                             Text(
//                               'nabeel.aali',
//                               style: TextStyle(color: Color(0xffC690FF)),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width * 0.05,
//                       ),
//                       Image(image: AssetImage("assets/images/vectorplus.png")),
//                       new Spacer(),
//                       Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Container(
//                           width: MediaQuery.of(context).size.width * 0.38,
//                           height: MediaQuery.of(context).size.height * 0.08,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(30.0),
//                             color: Color(0xff3e0f60).withOpacity(0.99),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Row(
//                               children: [
//                                 Text(
//                                   '123.34',
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 24),
//                                 ),
//                                 SizedBox(
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.03,
//                                 ),

//                                 Image(
//                                     image: AssetImage(
//                                         "assets/images/Etherium-3.png"))
//                                 // CircleAvatar(
//                                 //   maxRadius: 30,
//                                 //   backgroundImage:
//                                 //       AssetImage("assets/images/Etherium-3.png"),
//                                 // ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               GlassmorphicContainer(
//                   height: MediaQuery.of(context).size.height * 0.233,
//                   width: MediaQuery.of(context).size.width * 0.9,
//                   borderRadius: 20,
//                   blur: 15,
//                   alignment: Alignment.center,
//                   border: 0,
//                   linearGradient: LinearGradient(colors: [
//                     Colors.white.withOpacity(0.1),
//                     Colors.white38.withOpacity(0.1)
//                   ], begin: Alignment.topLeft, end: Alignment.bottomRight),
//                   borderGradient: LinearGradient(colors: [
//                     Colors.white24.withOpacity(0.15),
//                     Colors.white70.withOpacity(0.15)
//                   ]),
//                   child: Container(
//                       decoration: BoxDecoration(boxShadow: [
//                         BoxShadow(
//                           blurRadius: 16,
//                           spreadRadius: 16,
//                           color: Colors.black.withOpacity(0.1),
//                         )
//                       ]),
//                       child: ClipRRect(
//                           borderRadius: BorderRadius.circular(20.0),
//                           child: BackdropFilter(
//                             filter: ImageFilter.blur(
//                               sigmaX: 20.0,
//                               sigmaY: 20.0,
//                             ),
//                             child: SizedBox(
//                               height: MediaQuery.of(context).size.height * 0.4,
//                               width: MediaQuery.of(context).size.width * 0.9,
//                               child: Container(
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       width: 150,
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(
//                                             top: 20.0, left: 40),
//                                         child: Column(
//                                           children: [
//                                             Text(
//                                               'Fly with Stars',
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontFamily: 'Red Rose',
//                                                   fontSize: 26),
//                                             ),
//                                             SizedBox(
//                                               height: MediaQuery.of(context)
//                                                       .size
//                                                       .height *
//                                                   0.02,
//                                             ),
//                                             Material(
//                                               elevation: 0.0,
//                                               // borderRadius:
//                                               //     BorderRadius
//                                               //         .circular(
//                                               //             20.0),
//                                               // color: Color(
//                                               //         0xffBD00FF)
//                                               //     .withOpacity(0.6),
//                                               color: Colors.transparent,
//                                               child: GlassmorphicContainer(
//                                                   height: MediaQuery.of(context)
//                                                           .size
//                                                           .height *
//                                                       0.08,
//                                                   width:
//                                                       MediaQuery.of(context).size.width *
//                                                           0.7,
//                                                   borderRadius: 20,
//                                                   blur: 15,
//                                                   alignment: Alignment.center,
//                                                   border: 0,
//                                                   linearGradient: LinearGradient(
//                                                       colors: [
//                                                         Color(0xffBD00FF)
//                                                             .withOpacity(0.4),
//                                                         Color(0xffBD00FF)
//                                                             .withOpacity(0.4)
//                                                       ],
//                                                       begin: Alignment.topLeft,
//                                                       end: Alignment
//                                                           .bottomRight),
//                                                   borderGradient:
//                                                       LinearGradient(colors: [
//                                                     Colors.grey
//                                                         .withOpacity(0.15),
//                                                     Colors.grey
//                                                         .withOpacity(0.15)
//                                                   ]),
//                                                   child: Container(
//                                                       width:
//                                                           MediaQuery.of(context)
//                                                                   .size
//                                                                   .width *
//                                                               0.7,
//                                                       height:
//                                                           MediaQuery.of(context)
//                                                                   .size
//                                                                   .height *
//                                                               0.09,
//                                                       decoration:
//                                                           BoxDecoration(boxShadow: [
//                                                         BoxShadow(
//                                                           blurRadius: 16,
//                                                           spreadRadius: 16,
//                                                           color: Colors.black
//                                                               .withOpacity(0.1),
//                                                         )
//                                                       ]),
//                                                       child: ClipRRect(
//                                                           borderRadius: BorderRadius.circular(20.0),
//                                                           child: BackdropFilter(
//                                                               filter: ImageFilter.blur(
//                                                                 sigmaX: 20.0,
//                                                                 sigmaY: 20.0,
//                                                               ),
//                                                               child: MaterialButton(
//                                                                 onPressed:
//                                                                     () async {},
//                                                                 child:
//                                                                     const Text(
//                                                                   'Fly',
//                                                                   style: TextStyle(
//                                                                       color: Colors
//                                                                           .white,
//                                                                       fontSize:
//                                                                           20,
//                                                                       letterSpacing:
//                                                                           6),
//                                                                 ),
//                                                               ))))),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                     Image(
//                                         image:
//                                             AssetImage('assets/images/vr.png'))
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           )))),
//               Padding(
//                 padding: const EdgeInsets.only(left: 30.0, right: 30),
//                 child: Row(
//                   children: [
//                     Text('Popular Stars',
//                         style: TextStyle(color: Colors.white, fontSize: 24)),
//                     new Spacer(),
//                     TextButton(
//                         onPressed: () {},
//                         child: Text(
//                           'View All',
//                           style: TextStyle(color: Color(0xffC690FF)),
//                         ))
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 20.0, right: 20),
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Container(
//                     child: Row(
//                       children: [
//                         GlassmorphicContainer(
//                             height: MediaQuery.of(context).size.height * 0.233,
//                             width: MediaQuery.of(context).size.width * 0.6,
//                             borderRadius: 20,
//                             blur: 15,
//                             alignment: Alignment.center,
//                             border: 0,
//                             linearGradient: LinearGradient(
//                                 colors: [
//                                   Colors.white.withOpacity(0.1),
//                                   Colors.white38.withOpacity(0.1)
//                                 ],
//                                 begin: Alignment.topLeft,
//                                 end: Alignment.bottomRight),
//                             borderGradient: LinearGradient(colors: [
//                               Colors.white24.withOpacity(0.15),
//                               Colors.white70.withOpacity(0.15)
//                             ]),
//                             child: Container(
//                                 decoration: BoxDecoration(boxShadow: [
//                                   BoxShadow(
//                                     blurRadius: 16,
//                                     spreadRadius: 16,
//                                     color: Colors.black.withOpacity(0.1),
//                                   )
//                                 ]),
//                                 child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(20.0),
//                                     child: BackdropFilter(
//                                       filter: ImageFilter.blur(
//                                         sigmaX: 20.0,
//                                         sigmaY: 20.0,
//                                       ),
//                                       child: SizedBox(
//                                         height:
//                                             MediaQuery.of(context).size.height *
//                                                 0.4,
//                                         width:
//                                             MediaQuery.of(context).size.width *
//                                                 0.9,
//                                         child: Container(
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [
//                                               Container(
//                                                 child: Column(
//                                                   children: [
//                                                     Row(
//                                                       children: [
//                                                         SizedBox(
//                                                           width: 110,
//                                                           child: Image(
//                                                               image: AssetImage(
//                                                                   'assets/images/sec1.png')),
//                                                         ),
//                                                         SizedBox(
//                                                           width: MediaQuery.of(
//                                                                       context)
//                                                                   .size
//                                                                   .width *
//                                                               .03,
//                                                         ),
//                                                         Container(
//                                                           child: Column(
//                                                             mainAxisAlignment:
//                                                                 MainAxisAlignment
//                                                                     .center,
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .start,
//                                                             children: [
//                                                               Text(
//                                                                 'Mars',
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .white,
//                                                                     fontSize:
//                                                                         20),
//                                                                 textAlign:
//                                                                     TextAlign
//                                                                         .left,
//                                                               ),
//                                                               SizedBox(
//                                                                 height: MediaQuery.of(
//                                                                             context)
//                                                                         .size
//                                                                         .height *
//                                                                     0.015,
//                                                               ),
//                                                               Text(
//                                                                 '0.03 ETH',
//                                                                 style: TextStyle(
//                                                                     color: Color(
//                                                                         0xff63219D),
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .bold),
//                                                               ),
//                                                               SizedBox(
//                                                                 height: MediaQuery.of(
//                                                                             context)
//                                                                         .size
//                                                                         .height *
//                                                                     0.015,
//                                                               ),
//                                                               Text(
//                                                                 '123 KM',
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .white,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w200),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         )
//                                                       ],
//                                                     ),
//                                                     Material(
//                                                       elevation: 0.0,
//                                                       color: Colors.transparent,
//                                                       child:
//                                                           GlassmorphicContainer(
//                                                               height: MediaQuery.of(context)
//                                                                       .size
//                                                                       .height *
//                                                                   0.07,
//                                                               width: MediaQuery.of(context)
//                                                                       .size
//                                                                       .width *
//                                                                   0.5,
//                                                               borderRadius: 20,
//                                                               blur: 15,
//                                                               alignment: Alignment
//                                                                   .center,
//                                                               border: 0,
//                                                               linearGradient: LinearGradient(
//                                                                   colors: [
//                                                                     Color(0xffBD00FF)
//                                                                         .withOpacity(
//                                                                             0.4),
//                                                                     Color(0xffBD00FF)
//                                                                         .withOpacity(
//                                                                             0.4)
//                                                                   ],
//                                                                   begin: Alignment
//                                                                       .topLeft,
//                                                                   end: Alignment
//                                                                       .bottomRight),
//                                                               borderGradient:
//                                                                   LinearGradient(
//                                                                       colors: [
//                                                                     Colors.grey
//                                                                         .withOpacity(
//                                                                             0.15),
//                                                                     Colors.grey
//                                                                         .withOpacity(
//                                                                             0.15)
//                                                                   ]),
//                                                               child: Container(
//                                                                   width: MediaQuery.of(context).size.width * 0.7,
//                                                                   height: MediaQuery.of(context).size.height * 0.09,
//                                                                   decoration: BoxDecoration(boxShadow: [
//                                                                     BoxShadow(
//                                                                       blurRadius:
//                                                                           16,
//                                                                       spreadRadius:
//                                                                           16,
//                                                                       color: Colors
//                                                                           .black
//                                                                           .withOpacity(
//                                                                               0.1),
//                                                                     )
//                                                                   ]),
//                                                                   child: ClipRRect(
//                                                                       borderRadius: BorderRadius.circular(20.0),
//                                                                       child: BackdropFilter(
//                                                                           filter: ImageFilter.blur(
//                                                                             sigmaX:
//                                                                                 20.0,
//                                                                             sigmaY:
//                                                                                 20.0,
//                                                                           ),
//                                                                           child: MaterialButton(
//                                                                             onPressed:
//                                                                                 () async {},
//                                                                             child:
//                                                                                 const Text(
//                                                                               'Fly with Stars',
//                                                                               style: TextStyle(color: Colors.white, fontSize: 20, letterSpacing: 2),
//                                                                             ),
//                                                                           ))))),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     )))),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 8.0),
//                           child: GlassmorphicContainer(
//                               height:
//                                   MediaQuery.of(context).size.height * 0.233,
//                               width: MediaQuery.of(context).size.width * 0.6,
//                               borderRadius: 20,
//                               blur: 15,
//                               alignment: Alignment.center,
//                               border: 0,
//                               linearGradient: LinearGradient(
//                                   colors: [
//                                     Colors.white.withOpacity(0.1),
//                                     Colors.white38.withOpacity(0.1)
//                                   ],
//                                   begin: Alignment.topLeft,
//                                   end: Alignment.bottomRight),
//                               borderGradient: LinearGradient(colors: [
//                                 Colors.white24.withOpacity(0.15),
//                                 Colors.white70.withOpacity(0.15)
//                               ]),
//                               child: Container(
//                                   decoration: BoxDecoration(boxShadow: [
//                                     BoxShadow(
//                                       blurRadius: 16,
//                                       spreadRadius: 16,
//                                       color: Colors.black.withOpacity(0.1),
//                                     )
//                                   ]),
//                                   child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(20.0),
//                                       child: BackdropFilter(
//                                         filter: ImageFilter.blur(
//                                           sigmaX: 20.0,
//                                           sigmaY: 20.0,
//                                         ),
//                                         child: SizedBox(
//                                           height: MediaQuery.of(context)
//                                                   .size
//                                                   .height *
//                                               0.4,
//                                           width: MediaQuery.of(context)
//                                                   .size
//                                                   .width *
//                                               0.9,
//                                           child: Container(
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 Container(
//                                                   child: Column(
//                                                     children: [
//                                                       Row(
//                                                         children: [
//                                                           SizedBox(
//                                                             width: 110,
//                                                             child: Image(
//                                                                 image: AssetImage(
//                                                                     'assets/images/sec1.png')),
//                                                           ),
//                                                           SizedBox(
//                                                             width: MediaQuery.of(
//                                                                         context)
//                                                                     .size
//                                                                     .width *
//                                                                 .03,
//                                                           ),
//                                                           Container(
//                                                             child: Column(
//                                                               mainAxisAlignment:
//                                                                   MainAxisAlignment
//                                                                       .center,
//                                                               crossAxisAlignment:
//                                                                   CrossAxisAlignment
//                                                                       .start,
//                                                               children: [
//                                                                 Text(
//                                                                   'Venus',
//                                                                   style: TextStyle(
//                                                                       color: Colors
//                                                                           .white,
//                                                                       fontSize:
//                                                                           20),
//                                                                   textAlign:
//                                                                       TextAlign
//                                                                           .left,
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height: MediaQuery.of(
//                                                                               context)
//                                                                           .size
//                                                                           .height *
//                                                                       0.015,
//                                                                 ),
//                                                                 Text(
//                                                                   '0.012 ETH',
//                                                                   style: TextStyle(
//                                                                       color: Color(
//                                                                           0xff63219D),
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .bold),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height: MediaQuery.of(
//                                                                               context)
//                                                                           .size
//                                                                           .height *
//                                                                       0.015,
//                                                                 ),
//                                                                 Text(
//                                                                   '129 KM',
//                                                                   style: TextStyle(
//                                                                       color: Colors
//                                                                           .white,
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .w200),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           )
//                                                         ],
//                                                       ),
//                                                       Material(
//                                                         elevation: 0.0,
//                                                         color:
//                                                             Colors.transparent,
//                                                         child:
//                                                             GlassmorphicContainer(
//                                                                 height: MediaQuery.of(context)
//                                                                         .size
//                                                                         .height *
//                                                                     0.07,
//                                                                 width: MediaQuery.of(context)
//                                                                         .size
//                                                                         .width *
//                                                                     0.5,
//                                                                 borderRadius:
//                                                                     20,
//                                                                 blur: 15,
//                                                                 alignment:
//                                                                     Alignment
//                                                                         .center,
//                                                                 border: 0,
//                                                                 linearGradient: LinearGradient(
//                                                                     colors: [
//                                                                       Color(0xffBD00FF)
//                                                                           .withOpacity(
//                                                                               0.4),
//                                                                       Color(0xffBD00FF)
//                                                                           .withOpacity(
//                                                                               0.4)
//                                                                     ],
//                                                                     begin: Alignment
//                                                                         .topLeft,
//                                                                     end: Alignment
//                                                                         .bottomRight),
//                                                                 borderGradient:
//                                                                     LinearGradient(colors: [
//                                                                   Colors.grey
//                                                                       .withOpacity(
//                                                                           0.15),
//                                                                   Colors.grey
//                                                                       .withOpacity(
//                                                                           0.15)
//                                                                 ]),
//                                                                 child: Container(
//                                                                     width: MediaQuery.of(context).size.width * 0.7,
//                                                                     height: MediaQuery.of(context).size.height * 0.09,
//                                                                     decoration: BoxDecoration(boxShadow: [
//                                                                       BoxShadow(
//                                                                         blurRadius:
//                                                                             16,
//                                                                         spreadRadius:
//                                                                             16,
//                                                                         color: Colors
//                                                                             .black
//                                                                             .withOpacity(0.1),
//                                                                       )
//                                                                     ]),
//                                                                     child: ClipRRect(
//                                                                         borderRadius: BorderRadius.circular(20.0),
//                                                                         child: BackdropFilter(
//                                                                             filter: ImageFilter.blur(
//                                                                               sigmaX: 20.0,
//                                                                               sigmaY: 20.0,
//                                                                             ),
//                                                                             child: MaterialButton(
//                                                                               onPressed: () async {},
//                                                                               child: const Text(
//                                                                                 'Fly with Stars',
//                                                                                 style: TextStyle(color: Colors.white, fontSize: 20, letterSpacing: 2),
//                                                                               ),
//                                                                             ))))),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       )))),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 30.0, right: 30),
//                 child: Row(
//                   children: [
//                     Text('Featured Visitors',
//                         style: TextStyle(color: Colors.white, fontSize: 24)),
//                     new Spacer(),
//                     TextButton(
//                         onPressed: () {},
//                         child: Text(
//                           'View All',
//                           style: TextStyle(color: Color(0xffC690FF)),
//                         ))
//                   ],
//                 ),
//               ),
//               GlassmorphicContainer(
//                   height: MediaQuery.of(context).size.height * 0.1,
//                   width: MediaQuery.of(context).size.width * 0.9,
//                   borderRadius: 20,
//                   blur: 15,
//                   alignment: Alignment.center,
//                   border: 0,
//                   linearGradient: LinearGradient(colors: [
//                     Colors.white.withOpacity(0.1),
//                     Colors.white38.withOpacity(0.1)
//                   ], begin: Alignment.topLeft, end: Alignment.bottomRight),
//                   borderGradient: LinearGradient(colors: [
//                     Colors.white24.withOpacity(0.15),
//                     Colors.white70.withOpacity(0.15)
//                   ]),
//                   child: Container(
//                       decoration: BoxDecoration(boxShadow: [
//                         BoxShadow(
//                           blurRadius: 16,
//                           spreadRadius: 16,
//                           color: Colors.black.withOpacity(0.1),
//                         )
//                       ]),
//                       child: ClipRRect(
//                           borderRadius: BorderRadius.circular(20.0),
//                           child: BackdropFilter(
//                             filter: ImageFilter.blur(
//                               sigmaX: 20.0,
//                               sigmaY: 20.0,
//                             ),
//                             child: SizedBox(
//                               // height: MediaQuery.of(context).size.height * 0.2,
//                               // width: MediaQuery.of(context).size.width * 0.9,
//                               child: Container(
//                                 child: Row(
//                                   children: [
//                                     ClipRRect(
//                                         borderRadius:
//                                             BorderRadius.circular(20.0),
//                                         child: Container(
//                                           child: Align(
//                                             widthFactor: 2.5,
//                                             heightFactor: 2.5,
//                                             child: Image(
//                                                 image: AssetImage(
//                                                     'assets/images/Rectangle 35.png')),
//                                           ),
//                                         )),
//                                     Padding(
//                                       padding: const EdgeInsets.all(1.0),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Text(
//                                             'Kay Saif',
//                                             style:
//                                                 TextStyle(color: Colors.white),
//                                             textAlign: TextAlign.left,
//                                           ),
//                                           SizedBox(
//                                             height: MediaQuery.of(context)
//                                                     .size
//                                                     .height *
//                                                 0.015,
//                                           ),
//                                           Text(
//                                             '1.4 Followers',
//                                             style:
//                                                 TextStyle(color: Colors.grey),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     new Spacer(),
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: SizedBox(
//                                         width:
//                                             MediaQuery.of(context).size.width *
//                                                 0.3,
//                                         child: TextButton(
//                                             onPressed: () {},
//                                             style: ButtonStyle(
//                                               shape: MaterialStateProperty.all(
//                                                   RoundedRectangleBorder(
//                                                       side: BorderSide(
//                                                           color: Colors.white,
//                                                           width: 1),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20.0))),
//                                             ),
//                                             child: Text(
//                                               'Follow',
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontWeight: FontWeight.w400),
//                                             )),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           )))),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: GlassmorphicContainer(
//                     height: MediaQuery.of(context).size.height * 0.08,
//                     width: MediaQuery.of(context).size.width * 0.9,
//                     borderRadius: 20,
//                     blur: 15,
//                     alignment: Alignment.center,
//                     border: 0,
//                     linearGradient: LinearGradient(colors: [
//                       Colors.white.withOpacity(0.1),
//                       Colors.white38.withOpacity(0.1)
//                     ], begin: Alignment.topLeft, end: Alignment.bottomRight),
//                     borderGradient: LinearGradient(colors: [
//                       Colors.white24.withOpacity(0.15),
//                       Colors.white70.withOpacity(0.15)
//                     ]),
//                     child: Container(
//                         decoration: BoxDecoration(boxShadow: [
//                           BoxShadow(
//                             blurRadius: 16,
//                             spreadRadius: 16,
//                             color: Colors.black.withOpacity(0.1),
//                           )
//                         ]),
//                         child: ClipRRect(
//                             borderRadius: BorderRadius.circular(20.0),
//                             child: BackdropFilter(
//                               filter: ImageFilter.blur(
//                                 sigmaX: 20.0,
//                                 sigmaY: 20.0,
//                               ),
//                               child: SizedBox(
//                                 height:
//                                     MediaQuery.of(context).size.height * 0.4,
//                                 width: MediaQuery.of(context).size.width * 0.9,
//                                 child: Container(
//                                   child: Row(
//                                     children: [
//                                       Container(
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             SizedBox(
//                                               width: MediaQuery.of(context)
//                                                       .size
//                                                       .width *
//                                                   0.05,
//                                             ),
//                                             // IconButton(
//                                             //     onPressed: () {
//                                             //       Navigator.push(
//                                             //           context,
//                                             //           MaterialPageRoute(
//                                             //               builder: (context) =>
//                                             //                   Splash()));
//                                             //     },
//                                             //     icon: Icon(
//                                             //       Icons.send,
//                                             //       color: Colors.grey,
//                                             //     )),
//                                             switches(Icons.send, 'Red'),
//                                             SizedBox(
//                                               width: MediaQuery.of(context)
//                                                       .size
//                                                       .width *
//                                                   0.05,
//                                             ),
//                                             // IconButton(
//                                             //     onPressed: () {},
//                                             //     icon: Icon(
//                                             //       Icons.message,
//                                             //       color: Colors.grey,
//                                             //     )),

//                                             switches(Icons.message, 'yellow'),
//                                             SizedBox(
//                                               width: MediaQuery.of(context)
//                                                       .size
//                                                       .width *
//                                                   0.05,
//                                             ),
//                                             // IconButton(
//                                             //     onPressed: () {},
//                                             //     icon: Icon(
//                                             //       Icons.home_max,
//                                             //       color: Colors.grey,
//                                             //     )),
//                                             switches(Icons.home_max, 'blue'),
//                                             SizedBox(
//                                               width: MediaQuery.of(context)
//                                                       .size
//                                                       .width *
//                                                   0.05,
//                                             ),
//                                             // IconButton(
//                                             //     onPressed: () {},
//                                             //     icon: Icon(
//                                             //       Icons.search,
//                                             //       color: Colors.grey,
//                                             //     )),

//                                             switches(Icons.search, 'black'),
//                                             SizedBox(
//                                               width: MediaQuery.of(context)
//                                                       .size
//                                                       .width *
//                                                   0.05,
//                                             ),
//                                             // IconButton(
//                                             //     onPressed: () {},
//                                             //     icon: Icon(
//                                             //       Icons.notifications,
//                                             //       color: Colors.grey,
//                                             //     )),
//                                             switches(
//                                                 Icons.notifications, 'pink'),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             )))),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }

// // GlassmorphicContainer(
// //               height: MediaQuery.of(context).size.height * 0.2,
// //               width: MediaQuery.of(context).size.width * 0.9,
// //               borderRadius: 40,
// //               blur: 15,
// //               alignment: Alignment.center,
// //               border: 0,
// //               linearGradient: LinearGradient(colors: [
// //                 Colors.white.withOpacity(0.1),
// //                 Colors.white38.withOpacity(0.1)
// //               ], begin: Alignment.topLeft, end: Alignment.bottomRight),
// //               borderGradient: LinearGradient(colors: [
// //                 Colors.white24.withOpacity(0.15),
// //                 Colors.white70.withOpacity(0.15)
// //               ]),
// //               child: Container(
// //                   decoration: BoxDecoration(boxShadow: [
// //                     BoxShadow(
// //                       blurRadius: 16,
// //                       spreadRadius: 16,
// //                       color: Colors.black.withOpacity(0.1),
// //                     )
// //                   ]),
// //                   child: ClipRRect(
// //                       borderRadius: BorderRadius.circular(40.0),
// //                       child: BackdropFilter(
// //                         filter: ImageFilter.blur(
// //                           sigmaX: 20.0,
// //                           sigmaY: 20.0,
// //                         ),
// //                         child: SizedBox(
// //                           height: MediaQuery.of(context).size.height * 0.4,
// //                           width: MediaQuery.of(context).size.width * 0.9,
// //                           child: Container(
// //                             child: Row(
// //                               children: [
// //                                 Container(),
// //                               ],
// //                             ),
// //                           ),
// //                         ),
// //                       )))),
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:path/path.dart';

// class ImageUploads extends StatefulWidget {
//   ImageUploads({Key? key}) : super(key: key);

//   @override
//   _ImageUploadsState createState() => _ImageUploadsState();
// }

// class _ImageUploadsState extends State<ImageUploads> {
//   firebase_storage.FirebaseStorage storage =
//       firebase_storage.FirebaseStorage.instance;

//   File? _photo;
//   final ImagePicker _picker = ImagePicker();

//   Future imgFromGallery() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

//     setState(() {
//       if (pickedFile != null) {
//         _photo = File(pickedFile.path);
//         uploadFile();
//       } else {
//         print('No image selected.');
//       }
//     });
//   }

//   Future imgFromCamera() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.camera);

//     setState(() {
//       if (pickedFile != null) {
//         _photo = File(pickedFile.path);
//         uploadFile();
//       } else {
//         print('No image selected.');
//       }
//     });
//   }

//   Future uploadFile() async {
//     if (_photo == null) return;
//     final fileName = basename(_photo!.path);
//     final destination = 'gs://space-afdf1.appspot.com/$fileName';

//     try {
//       final ref = firebase_storage.FirebaseStorage.instance
//           .ref(destination)
//           .child('gs://space-afdf1.appspot.com/');
//       await ref.putFile(_photo!);
//     } catch (e) {
//       print(' error $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: <Widget>[
//           SizedBox(
//             height: 32,
//           ),
//           Center(
//             child: GestureDetector(
//               onTap: () {
//                 _showPicker(context);
//               },
//               child: CircleAvatar(
//                 radius: 55,
//                 backgroundColor: Color(0xffFDCF09),
//                 child: _photo != null
//                     ? ClipRRect(
//                         borderRadius: BorderRadius.circular(50),
//                         child: Image.file(
//                           _photo!,
//                           width: 100,
//                           height: 100,
//                           fit: BoxFit.fitHeight,
//                         ),
//                       )
//                     : Container(
//                         decoration: BoxDecoration(
//                             color: Colors.grey[200],
//                             borderRadius: BorderRadius.circular(50)),
//                         width: 100,
//                         height: 100,
//                         child: Icon(
//                           Icons.camera_alt,
//                           color: Colors.grey[800],
//                         ),
//                       ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   void _showPicker(context) {
//     showModalBottomSheet(
//         context: context,
//         builder: (BuildContext bc) {
//           return SafeArea(
//             child: Container(
//               child: new Wrap(
//                 children: <Widget>[
//                   new ListTile(
//                       leading: new Icon(Icons.photo_library),
//                       title: new Text('Gallery'),
//                       onTap: () {
//                         imgFromGallery();
//                         Navigator.of(context).pop();
//                       }),
//                   new ListTile(
//                     leading: new Icon(Icons.photo_camera),
//                     title: new Text('Camera'),
//                     onTap: () {
//                       imgFromCamera();
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize a new Firebase App instance
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseStorage storage = FirebaseStorage.instance;

  // Select and image from the gallery or take a picture with the camera
  // Then upload to Firebase Storage
  Future<void> _upload(String inputSource) async {
    final picker = ImagePicker();
    XFile? pickedImage;
    try {
      pickedImage = await picker.pickImage(
          source: inputSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 1920);

      final String fileName = path.basename(pickedImage!.path);
      File imageFile = File(pickedImage.path);

      try {
        // Uploading the selected image with some custom meta data
        await storage.ref(fileName).putFile(
            imageFile,
            SettableMetadata(customMetadata: {
              'uploaded_by': 'A bad guy',
              'description': 'Some description...'
            }));

        // Refresh the UI
        setState(() {});
      } on FirebaseException catch (error) {
        if (kDebugMode) {
          print(error);
        }
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

  // Retriew the uploaded images
  // This function is called when the app launches for the first time or when an image is uploaded or deleted
  Future<List<Map<String, dynamic>>> _loadImages() async {
    List<Map<String, dynamic>> files = [];

    final ListResult result = await storage.ref().list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final FullMetadata fileMeta = await file.getMetadata();
      files.add({
        "url": fileUrl,
        "path": file.fullPath,
        "uploaded_by": fileMeta.customMetadata?['uploaded_by'] ?? 'Nobody',
        "description":
            fileMeta.customMetadata?['description'] ?? 'No description'
      });
    });

    return files;
  }

  // Delete the selected image
  // This function is called when a trash icon is pressed
  Future<void> _delete(String ref) async {
    await storage.ref(ref).delete();
    // Rebuild the UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                    onPressed: () => _upload('camera'),
                    icon: const Icon(Icons.camera),
                    label: const Text('camera')),
                ElevatedButton.icon(
                    onPressed: () => _upload('gallery'),
                    icon: const Icon(Icons.library_add),
                    label: const Text('Gallery')),
              ],
            ),
            Expanded(
              child: FutureBuilder(
                future: _loadImages(),
                builder: (context,
                    AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        final Map<String, dynamic> image =
                            snapshot.data![index];

                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            dense: false,
                            leading: Image.network(image['url']),
                            title: Text(image['uploaded_by']),
                            subtitle: Text(image['description']),
                            trailing: IconButton(
                              onPressed: () => _delete(image['path']),
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
