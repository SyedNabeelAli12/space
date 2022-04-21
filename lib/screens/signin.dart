import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flooter/config/palette.dart';
import 'package:flooter/nav.dart';
import 'package:flooter/screens/navscreen.dart';
import 'package:flooter/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordNoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: height * 0.07,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          'Space',
          style: TextStyle(
              color: Palette.facebookBlue,
              fontSize: width * 0.07,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      backgroundColor: Color(0xFFF0F2F5),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: width * 0.05,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 100,
                      child: Text('Sign In\nConnect With Us',
                          style: TextStyle(
                              fontSize: 28,
                              color: Palette.facebookBlue,
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.left),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 100,
                            child: Text('Email',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w200),
                                textAlign: TextAlign.left),
                          ),
                        ),
                        Container(
                            child: Column(children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: TextFormField(
                              controller: emailController,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  filled: true,
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w100),
                                  hintText: "Enter e-mail",
                                  fillColor: Colors.transparent),

                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Email';
                                }
                                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                  return "Please enter a valid email address";
                                }

                                // the email is valid
                                return null;
                              },
                              //   return null;
                              // },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 100,
                              child: Text('Password',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w200),
                                  textAlign: TextAlign.left),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Password';
                                }
                                if (value.trim().length < 6) {
                                  return 'Password Incorrect! At least 6 characters in length';
                                }
                                return null;
                              },
                              controller: passwordNoController,
                              obscureText: true,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    // borderSide:
                                    //     const BorderSide(
                                    //         color: Colors
                                    //             .white,
                                    //         width: 2),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  filled: true,
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w100),
                                  hintText: "Enter Password",
                                  fillColor: Colors.transparent),
                            ),
                          ),
                        ])),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03),
                        MaterialButton(
                          height: 50,
                          elevation: 5,
                          minWidth: 350,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Palette.facebookBlue,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              EasyLoading.show(status: 'Signing You In');
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder:
                              //             (context) =>
                              //                 Home()));
                              try {
                                UserCredential userCredential =
                                    await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                            email: emailController.text,
                                            password:
                                                passwordNoController.text);

                                FirebaseAuth.instance
                                    .authStateChanges()
                                    .listen((User? user) {
                                  if (user == null) {
                                    print('User is currently signed out!');
                                  } else {
                                    print(user);

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Nav()));
                                    // print(user
                                    //     .email);
                                    EasyLoading.dismiss();
                                  }
                                });
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  Fluttertoast.showToast(
                                      msg: "User not Found",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 2,
                                      backgroundColor: Colors.grey,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                } else if (e.code == 'wrong-password') {
                                  Fluttertoast.showToast(
                                      msg: "Wrong Password",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 2,
                                      backgroundColor: Colors.grey,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                }
                              }
                            }
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signup()));
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.grey, width: 1),
                                      borderRadius:
                                          BorderRadius.circular(20.0))),
                            ),
                            child: Text(
                              "Don't have a Account? Sign Up",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400),
                            )),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NavScreen()));
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.grey, width: 1),
                                      borderRadius:
                                          BorderRadius.circular(20.0))),
                            ),
                            child: Text(
                              "Forgot Your Password? ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400),
                            )),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
