import 'dart:ui';

import 'package:flooter/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  void dispose() {
    super.dispose();
    name.dispose();
    email.dispose();
    password.dispose();
    phone.dispose();
  }

  TextEditingController email = new TextEditingController();
  TextEditingController name = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                        height: MediaQuery.of(context).size.height * 0.8,
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
                                        0.8,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: SingleChildScrollView(
                                      child: Container(
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
                                                child: Text('Welcome Aboard ',
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
                                                child: Form(
                                              key: _formKey,
                                              child: Column(children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.8,
                                                  child: TextFormField(
                                                    controller: email,
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
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        filled: true,
                                                        hintStyle: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w100),
                                                        hintText:
                                                            "Enter e-mail",
                                                        fillColor:
                                                            Colors.transparent),
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Enter Email';
                                                      }
                                                      if (!RegExp(
                                                              r'\S+@\S+\.\S+')
                                                          .hasMatch(value)) {
                                                        return "Please enter a valid email address";
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      20.0),
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            100,
                                                    child: Text('Name',
                                                        style: TextStyle(
                                                            fontSize: 22,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w200),
                                                        textAlign:
                                                            TextAlign.left),
                                                  ),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.8,
                                                  child: TextFormField(
                                                    controller: name,
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
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        filled: true,
                                                        hintStyle: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w100),
                                                        hintText: "Enter Name",
                                                        fillColor:
                                                            Colors.transparent),
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Enter Name';
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      20.0),
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            100,
                                                    child: Text('Password',
                                                        style: TextStyle(
                                                            fontSize: 22,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w200),
                                                        textAlign:
                                                            TextAlign.left),
                                                  ),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.8,
                                                  child: TextFormField(
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Enter password';
                                                      }
                                                      return null;
                                                    },
                                                    controller: password,
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
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        filled: true,
                                                        hintStyle: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w100),
                                                        hintText:
                                                            "Enter Password",
                                                        fillColor:
                                                            Colors.transparent),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      20.0),
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            100,
                                                    child: Text('Phone',
                                                        style: TextStyle(
                                                            fontSize: 22,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w200),
                                                        textAlign:
                                                            TextAlign.left),
                                                  ),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.8,
                                                  child: TextFormField(
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Enter Phone Number';
                                                      }
                                                      return null;
                                                    },
                                                    controller: phone,
                                                    // obscureText: true,
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
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        filled: true,
                                                        hintStyle: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w100),
                                                        hintText:
                                                            "Enter Number",
                                                        fillColor:
                                                            Colors.transparent),
                                                  ),
                                                ),
                                              ]),
                                            )),
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
                                                                    // Navigator.push(
                                                                    //     context,
                                                                    //     MaterialPageRoute(
                                                                    //         builder:
                                                                    //             (context) =>
                                                                    //                 Home()));
                                                                    try {
                                                                      UserCredential
                                                                          userCredential =
                                                                          await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                                                              email: email.text,
                                                                              password: password.text);

                                                                      //                                                               Navigator.push(
                                                                      // context,
                                                                      // MaterialPageRoute(
                                                                      //     builder:
                                                                      //         (context) =>
                                                                      //             Login()));
                                                                    } on FirebaseAuthException catch (e) {
                                                                      if (e.code ==
                                                                          'weak-password') {
                                                                        print(
                                                                            'The password provided is too weak.');
                                                                      } else if (e
                                                                              .code ==
                                                                          'email-already-in-use') {
                                                                        print(
                                                                            'The account already exists for that email.');
                                                                      }
                                                                    } catch (e) {
                                                                      print(e);
                                                                    }
                                                                  }
                                                                },
                                                                child:
                                                                    const Text(
                                                                  'Submit',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          24,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ))))),
                                            ),
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
