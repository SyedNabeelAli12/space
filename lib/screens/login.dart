import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flooter/nav.dart';
import 'package:flooter/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordNoController = TextEditingController();
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
              // Positioned(
              //     top: MediaQuery.of(context).size.height / 4,
              //     right: MediaQuery.of(context).size.width * 0.05,
              //     child: Image(image: AssetImage('assets/images/image_1.png'))),
              Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: GlassmorphicContainer(
                        height: MediaQuery.of(context).size.height * 0.7,
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
                                borderRadius: BorderRadius.circular(20.0),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 20.0,
                                    sigmaY: 20.0,
                                  ),
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.7,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: Container(
                                      child: Form(
                                        key: _formKey,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    100,
                                                child: Text('Sign In ',
                                                    style: TextStyle(
                                                        fontSize: 28,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    textAlign: TextAlign.left),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    100,
                                                child: Text('Email',
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w200),
                                                    textAlign: TextAlign.left),
                                              ),
                                            ),
                                            Container(
                                                child: Column(children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.8,
                                                child: TextFormField(
                                                  validator: ((value) {
                                                    if (value == null) {
                                                      return 'Please Enter text';
                                                    }
                                                  }),
                                                  controller: emailController,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18),
                                                  decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(
                                                        // borderSide:
                                                        //     const BorderSide(
                                                        //         color: Colors
                                                        //             .white,
                                                        //         width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      filled: true,
                                                      hintStyle: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w100),
                                                      hintText: "Enter e-mail",
                                                      fillColor:
                                                          Colors.transparent),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(20.0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      100,
                                                  child: Text('Password',
                                                      style: TextStyle(
                                                          fontSize: 22,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w200),
                                                      textAlign:
                                                          TextAlign.left),
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.8,
                                                child: TextField(
                                                  controller:
                                                      passwordNoController,
                                                  obscureText: true,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18),
                                                  decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(
                                                        // borderSide:
                                                        //     const BorderSide(
                                                        //         color: Colors
                                                        //             .white,
                                                        //         width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      filled: true,
                                                      hintStyle: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w100),
                                                      hintText:
                                                          "Enter Password",
                                                      fillColor:
                                                          Colors.transparent),
                                                ),
                                              ),
                                            ])),
                                            SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03),
                                            Material(
                                              elevation: 0.0,
                                              color: Colors.transparent,
                                              child: GlassmorphicContainer(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.09,
                                                  width:
                                                      MediaQuery.of(context).size.width *
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
                                                                  if (_formKey
                                                                      .currentState!
                                                                      .validate()) {
                                                                    EasyLoading.show(
                                                                        status:
                                                                            'Signing You In');
                                                                    // Navigator.push(
                                                                    //     context,
                                                                    //     MaterialPageRoute(
                                                                    //         builder:
                                                                    //             (context) =>
                                                                    //                 Home()));
                                                                    try {
                                                                      UserCredential
                                                                          userCredential =
                                                                          await FirebaseAuth.instance.signInWithEmailAndPassword(
                                                                              email: emailController.text,
                                                                              password: passwordNoController.text);

                                                                      FirebaseAuth
                                                                          .instance
                                                                          .authStateChanges()
                                                                          .listen((User?
                                                                              user) {
                                                                        if (user ==
                                                                            null) {
                                                                          print(
                                                                              'User is currently signed out!');
                                                                        } else {
                                                                          print(
                                                                              user);

                                                                          Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(builder: (context) => Nav()));
                                                                          // print(user
                                                                          //     .email);
                                                                          EasyLoading
                                                                              .dismiss();
                                                                        }
                                                                      });
                                                                    } on FirebaseAuthException catch (e) {
                                                                      if (e.code ==
                                                                          'user-not-found') {
                                                                        Fluttertoast.showToast(
                                                                            msg:
                                                                                "User not Found",
                                                                            toastLength: Toast
                                                                                .LENGTH_SHORT,
                                                                            gravity: ToastGravity
                                                                                .CENTER,
                                                                            timeInSecForIosWeb:
                                                                                2,
                                                                            backgroundColor:
                                                                                Colors.grey,
                                                                            textColor: Colors.white,
                                                                            fontSize: 16.0);
                                                                      } else if (e
                                                                              .code ==
                                                                          'wrong-password') {
                                                                        Fluttertoast.showToast(
                                                                            msg:
                                                                                "Wrong Password",
                                                                            toastLength: Toast
                                                                                .LENGTH_SHORT,
                                                                            gravity: ToastGravity
                                                                                .CENTER,
                                                                            timeInSecForIosWeb:
                                                                                2,
                                                                            backgroundColor:
                                                                                Colors.grey,
                                                                            textColor: Colors.white,
                                                                            fontSize: 16.0);
                                                                      }
                                                                    }
                                                                  }
                                                                },
                                                                child:
                                                                    const Text(
                                                                  'Login',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          24,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ))))),
                                            ),
                                            SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.05),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Signup()));
                                                },
                                                style: ButtonStyle(
                                                  shape: MaterialStateProperty
                                                      .all(RoundedRectangleBorder(
                                                          side: BorderSide(
                                                              color: Colors
                                                                  .white,
                                                              width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0))),
                                                ),
                                                child: Text(
                                                  "Don't have a Account? Sign Up",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                )),
                                            SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Nav()));
                                                },
                                                style: ButtonStyle(
                                                  shape: MaterialStateProperty
                                                      .all(RoundedRectangleBorder(
                                                          side: BorderSide(
                                                              color: Colors
                                                                  .white,
                                                              width: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0))),
                                                ),
                                                child: Text(
                                                  "Forgot Your Password? ",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                )),
                                          ],
                                        ),
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
