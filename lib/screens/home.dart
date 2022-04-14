import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flooter/screens/login.dart';
import 'package:flooter/splash.dart';
import 'package:flutter/material.dart';

import 'package:glassmorphism/glassmorphism.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _useremail = '';
  late String _username = '';

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('No User Found');
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
        // Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => Login(), maintainState: true),
        //     (route) => false);

        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => Login()));
      } else {
        print(user);
        setState(() {
          _useremail = user.email!;
          _username = user.displayName!;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // User user = FirebaseAuth.instance.currentUser;
    var auth = FirebaseAuth.instance;
    return Container(
      // decoration: BoxDecoration(
      // image: DecorationImage(
      //   image: AssetImage("assets/images/image_3.png"),
      //   fit: BoxFit.cover,

      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 20.0, left: 15, right: 15, bottom: 10),
            child: Container(
              child: Row(
                children: [
                  CircleAvatar(
                    maxRadius: 25,
                    // backgroundImage: AssetImage("assets/images/my.png"),
                    backgroundImage: NetworkImage(
                        "https://firebasestorage.googleapis.com/v0/b/space-afdf1.appspot.com/o/scaled_d560f757-41a5-4a1f-997c-207afb9323894628600556992633123.jpg?alt=media&token=005fbc21-d923-43f1-8f85-1f925204440a"),

                    // backgroundImage: Image.network('https://picsum.photos/250?image=9'),

                    backgroundColor: Color(0xff63219D).withOpacity(0.4),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.26,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                _username,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015,
                          ),
                          Row(
                            children: [
                              Text(
                                _useremail,
                                style: TextStyle(color: Color(0xffC690FF)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Image(image: AssetImage("assets/images/vectorplus.png")),
                  new Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.38,
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Color(0xff3e0f60).withOpacity(0.99),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Text(
                              '123.34',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03,
                            ),

                            Image(
                                image:
                                    AssetImage("assets/images/Etherium-3.png"))
                            // CircleAvatar(
                            //   maxRadius: 30,
                            //   backgroundImage:
                            //       AssetImage("assets/images/Etherium-3.png"),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          GlassmorphicContainer(
              height: MediaQuery.of(context).size.height * 0.233,
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
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                  width: 150,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20.0, left: 40),
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
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
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
                                                  0.08,
                                              width:
                                                  MediaQuery.of(context).size.width *
                                                      0.7,
                                              borderRadius: 20,
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
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.7,
                                                  height: MediaQuery.of(context)
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
                                                      borderRadius:
                                                          BorderRadius.circular(20.0),
                                                      child: BackdropFilter(
                                                          filter: ImageFilter.blur(
                                                            sigmaX: 20.0,
                                                            sigmaY: 20.0,
                                                          ),
                                                          child: MaterialButton(
                                                            onPressed:
                                                                () async {},
                                                            child: const Text(
                                                              'Fly',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 20,
                                                                  letterSpacing:
                                                                      6),
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
                        ),
                      )))),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30),
            child: Row(
              children: [
                Text('Popular Stars',
                    style: TextStyle(color: Colors.white, fontSize: 24)),
                new Spacer(),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'View All',
                      style: TextStyle(color: Color(0xffC690FF)),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                child: Row(
                  children: [
                    GlassmorphicContainer(
                        height: MediaQuery.of(context).size.height * 0.233,
                        width: MediaQuery.of(context).size.width * 0.6,
                        borderRadius: 20,
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
                                borderRadius: BorderRadius.circular(20.0),
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
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 110,
                                                      child: Image(
                                                          image: AssetImage(
                                                              'assets/images/sec1.png')),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              .03,
                                                    ),
                                                    Container(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Mars',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20),
                                                            textAlign:
                                                                TextAlign.left,
                                                          ),
                                                          SizedBox(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.015,
                                                          ),
                                                          Text(
                                                            '0.03 ETH',
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xff63219D),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          SizedBox(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.015,
                                                          ),
                                                          Text(
                                                            '123 KM',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w200),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Material(
                                                  elevation: 0.0,
                                                  color: Colors.transparent,
                                                  child: GlassmorphicContainer(
                                                      height: MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.07,
                                                      width: MediaQuery.of(context).size.width *
                                                          0.5,
                                                      borderRadius: 20,
                                                      blur: 15,
                                                      alignment:
                                                          Alignment.center,
                                                      border: 0,
                                                      linearGradient: LinearGradient(
                                                          colors: [
                                                            Color(0xffBD00FF)
                                                                .withOpacity(
                                                                    0.4),
                                                            Color(0xffBD00FF)
                                                                .withOpacity(
                                                                    0.4)
                                                          ],
                                                          begin:
                                                              Alignment.topLeft,
                                                          end: Alignment
                                                              .bottomRight),
                                                      borderGradient:
                                                          LinearGradient(colors: [
                                                        Colors.grey
                                                            .withOpacity(0.15),
                                                        Colors.grey
                                                            .withOpacity(0.15)
                                                      ]),
                                                      child: Container(
                                                          width: MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.7,
                                                          height:
                                                              MediaQuery.of(context)
                                                                      .size
                                                                      .height *
                                                                  0.09,
                                                          decoration: BoxDecoration(boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 16,
                                                              spreadRadius: 16,
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.1),
                                                            )
                                                          ]),
                                                          child: ClipRRect(
                                                              borderRadius: BorderRadius.circular(20.0),
                                                              child: BackdropFilter(
                                                                  filter: ImageFilter.blur(
                                                                    sigmaX:
                                                                        20.0,
                                                                    sigmaY:
                                                                        20.0,
                                                                  ),
                                                                  child: MaterialButton(
                                                                    onPressed:
                                                                        () async {},
                                                                    child:
                                                                        const Text(
                                                                      'Fly with Stars',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              20,
                                                                          letterSpacing:
                                                                              2),
                                                                    ),
                                                                  ))))),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )))),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: GlassmorphicContainer(
                          height: MediaQuery.of(context).size.height * 0.233,
                          width: MediaQuery.of(context).size.width * 0.6,
                          borderRadius: 20,
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
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 20.0,
                                      sigmaY: 20.0,
                                    ),
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.4,
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      child: Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 110,
                                                        child: Image(
                                                            image: AssetImage(
                                                                'assets/images/sec1.png')),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            .03,
                                                      ),
                                                      Container(
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Venus',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 20),
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                            ),
                                                            SizedBox(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.015,
                                                            ),
                                                            Text(
                                                              '0.012 ETH',
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff63219D),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.015,
                                                            ),
                                                            Text(
                                                              '129 KM',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w200),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Material(
                                                    elevation: 0.0,
                                                    color: Colors.transparent,
                                                    child:
                                                        GlassmorphicContainer(
                                                            height: MediaQuery.of(context)
                                                                    .size
                                                                    .height *
                                                                0.07,
                                                            width: MediaQuery.of(context)
                                                                    .size
                                                                    .width *
                                                                0.5,
                                                            borderRadius: 20,
                                                            blur: 15,
                                                            alignment: Alignment
                                                                .center,
                                                            border: 0,
                                                            linearGradient: LinearGradient(
                                                                colors: [
                                                                  Color(0xffBD00FF)
                                                                      .withOpacity(
                                                                          0.4),
                                                                  Color(0xffBD00FF)
                                                                      .withOpacity(
                                                                          0.4)
                                                                ],
                                                                begin: Alignment
                                                                    .topLeft,
                                                                end: Alignment
                                                                    .bottomRight),
                                                            borderGradient:
                                                                LinearGradient(colors: [
                                                              Colors.grey
                                                                  .withOpacity(
                                                                      0.15),
                                                              Colors.grey
                                                                  .withOpacity(
                                                                      0.15)
                                                            ]),
                                                            child: Container(
                                                                width: MediaQuery.of(context).size.width * 0.7,
                                                                height: MediaQuery.of(context).size.height * 0.09,
                                                                decoration: BoxDecoration(boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        16,
                                                                    spreadRadius:
                                                                        16,
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.1),
                                                                  )
                                                                ]),
                                                                child: ClipRRect(
                                                                    borderRadius: BorderRadius.circular(20.0),
                                                                    child: BackdropFilter(
                                                                        filter: ImageFilter.blur(
                                                                          sigmaX:
                                                                              20.0,
                                                                          sigmaY:
                                                                              20.0,
                                                                        ),
                                                                        child: MaterialButton(
                                                                          onPressed:
                                                                              () async {},
                                                                          child:
                                                                              const Text(
                                                                            'Fly with Stars',
                                                                            style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: 20,
                                                                                letterSpacing: 2),
                                                                          ),
                                                                        ))))),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )))),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30),
            child: Row(
              children: [
                Text('Featured Visitors',
                    style: TextStyle(color: Colors.white, fontSize: 24)),
                new Spacer(),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'View All',
                      style: TextStyle(color: Color(0xffC690FF)),
                    ))
              ],
            ),
          ),
          GlassmorphicContainer(
              height: MediaQuery.of(context).size.height * 0.1,
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
                        child: SizedBox(
                          // height: MediaQuery.of(context).size.height * 0.2,
                          // width: MediaQuery.of(context).size.width * 0.9,
                          child: Container(
                            child: Row(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Container(
                                      child: Align(
                                        widthFactor: 2.5,
                                        heightFactor: 2.5,
                                        child: Image(
                                            image: AssetImage(
                                                'assets/images/Rectangle 35.png')),
                                      ),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Kay Saif',
                                        style: TextStyle(color: Colors.white),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.015,
                                      ),
                                      Text(
                                        '1.4 Followers',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                                new Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: TextButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      color: Colors.white,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0))),
                                        ),
                                        child: Text(
                                          'Follow',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400),
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )))),
        ],
      ),
    );
  }
}

// GlassmorphicContainer(
//               height: MediaQuery.of(context).size.height * 0.2,
//               width: MediaQuery.of(context).size.width * 0.9,
//               borderRadius: 40,
//               blur: 15,
//               alignment: Alignment.center,
//               border: 0,
//               linearGradient: LinearGradient(colors: [
//                 Colors.white.withOpacity(0.1),
//                 Colors.white38.withOpacity(0.1)
//               ], begin: Alignment.topLeft, end: Alignment.bottomRight),
//               borderGradient: LinearGradient(colors: [
//                 Colors.white24.withOpacity(0.15),
//                 Colors.white70.withOpacity(0.15)
//               ]),
//               child: Container(
//                   decoration: BoxDecoration(boxShadow: [
//                     BoxShadow(
//                       blurRadius: 16,
//                       spreadRadius: 16,
//                       color: Colors.black.withOpacity(0.1),
//                     )
//                   ]),
//                   child: ClipRRect(
//                       borderRadius: BorderRadius.circular(40.0),
//                       child: BackdropFilter(
//                         filter: ImageFilter.blur(
//                           sigmaX: 20.0,
//                           sigmaY: 20.0,
//                         ),
//                         child: SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.4,
//                           width: MediaQuery.of(context).size.width * 0.9,
//                           child: Container(
//                             child: Row(
//                               children: [
//                                 Container(),
//                               ],
//                             ),
//                           ),
//                         ),
//                       )))),
