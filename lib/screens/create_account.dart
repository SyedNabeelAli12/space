import 'package:flooter/config/palette.dart';
import 'package:flooter/screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateUserAccount extends StatefulWidget {
  const CreateUserAccount({Key? key}) : super(key: key);

  @override
  State<CreateUserAccount> createState() => _CreateUserAccountState();
}

class _CreateUserAccountState extends State<CreateUserAccount> {
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
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Center(
              child: Container(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 100,
                      child: Text('Welcome Aboard ',
                          style: TextStyle(
                              fontSize: 28,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
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
                            child: Form(
                          key: _formKey,
                          child: Column(children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: TextFormField(
                                controller: email,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
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
                                    hintText: "Enter e-mail",
                                    fillColor: Colors.transparent),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter Email';
                                  }
                                  if (!RegExp(r'\S+@\S+\.\S+')
                                      .hasMatch(value)) {
                                    return "Please enter a valid email address";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width - 100,
                                child: Text('Name',
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
                                controller: name,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
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
                                    hintText: "Enter Name",
                                    fillColor: Colors.transparent),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter Name';
                                  }
                                  return null;
                                },
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
                                    return 'Enter password';
                                  }
                                  return null;
                                },
                                controller: password,
                                obscureText: true,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
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
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width - 100,
                                child: Text('Phone',
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
                                    return 'Enter Phone Number';
                                  }
                                  return null;
                                },
                                controller: phone,
                                // obscureText: true,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
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
                                    hintText: "Enter Number",
                                    fillColor: Colors.transparent),
                              ),
                            ),
                          ]),
                        )),
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
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder:
                              //             (context) =>
                              //                 Home()));
                              try {
                                UserCredential userCredential =
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                            email: email.text,
                                            password: password.text);

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignIn()));
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  print('The password provided is too weak.');
                                } else if (e.code == 'email-already-in-use') {
                                  print(
                                      'The account already exists for that email.');
                                }
                              } catch (e) {
                                print(e);
                              }
                            }
                          },
                          child: const Text(
                            'Submit',
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03),
                      ],
                    ),
                  )
                ],
              )),
            ),
          )),
    );
  }
}
