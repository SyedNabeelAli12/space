import 'dart:io';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:image_picker/image_picker.dart';

import 'package:flooter/screens/login.dart';

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/foundation.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // const starsRef = ref(storage, 'images/stars.jpg');

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
        var file;
        //      Uploading the selected image with some custom meta data
        await storage.ref(fileName).putFile(
            imageFile,
            SettableMetadata(customMetadata: {
              'uploaded_by': nameController.text,
              'description': 'Profile Image...'
            }));
        file = await storage.ref(fileName).getDownloadURL();
        // print(file);
        await FirebaseAuth.instance.currentUser
            ?.updatePhotoURL(file.toString());
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

  TextEditingController emailController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  late var imageurl = '';

  @override
  void initState() {
    super.initState();

    () async {
      await FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          print('No User Found');
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Login()));
          // Navigator.pushAndRemoveUntil(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => Login(), maintainState: true),
          //     (route) => false);

          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => Login()));
        } else {
          print(user.email);
          print(user.photoURL);
          setState(() {
            emailController.text = user.email!;
            nameController.text = user.displayName!;
            // phoneController.text = user.phoneNumber!;
            // imageurl = user.photoURL!;
          });
          print(imageurl);
        }
      });
    }();
  }

  //   final Future<String> _calculation = Future<String>.delayed(
  //   const Duration(seconds: 2),
  //   () =>(auth!.photoURL!).toString(),
  // );

  Future<String> getImage() async {
    imageurl = auth!.photoURL!;
    return imageurl;
  }

  var auth = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    var auth = FirebaseAuth.instance.currentUser;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              children: [
                Container(
                  child: _glassWidget(
                    Container(
                      width: width * 0.9,
                      // height: height * 0.250,
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "My Profile ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                new Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextButton(
                                      onPressed: () async {
                                        await FirebaseAuth.instance.signOut();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Login()));
                                      },
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
                                        "Logout",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w400),
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.04,
                            ),
                            FutureBuilder<String>(
                              future:
                                  getImage(), // a previously-obtained Future<String> or null
                              builder: (BuildContext context,
                                  AsyncSnapshot<String> snapshot) {
                                if (snapshot.hasData) {
                                  return InkWell(
                                    onTap: () {
                                      _upload('camera');
                                    },
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Color(0xffBD00FF).withOpacity(0.2),
                                      radius: 50.0,
                                      // child: CircleAvatar(
                                      //   radius: 48.0,
                                      //   child: ClipOval(
                                      //       child: (imageurl == '')
                                      //           ? Text('Choose Image')
                                      //           : Image.network(imageurl)
                                      //       // : Text('Choose Image')
                                      //       // : Image.asset('assets/images/my.png')

                                      //       // child: (_image != null)
                                      //       // ? Image.file(_image)
                                      //       //:
                                      //       // child: Image.asset('assets/images/my.png'),
                                      //       ),
                                      //   backgroundColor: Colors.white,
                                      // ),
                                      backgroundImage: NetworkImage(imageurl),
                                    ),
                                  );
                                }
                                return Container(
                                  child: CircularProgressIndicator(),
                                );

                                // List<Widget> children;
                                // if (snapshot.hasData) {
                                //   children = <Widget>[
                                //     const Icon(
                                //       Icons.check_circle_outline,
                                //       color: Colors.green,
                                //       size: 60,
                                //     ),
                                //     Padding(
                                //       padding: const EdgeInsets.only(top: 16),
                                //       child: Text('Result: ${snapshot.data}'),
                                //     )
                                //   ];
                                // } else if (snapshot.hasError) {
                                //   children = <Widget>[
                                //     const Icon(
                                //       Icons.error_outline,
                                //       color: Colors.red,
                                //       size: 60,
                                //     ),
                                //     Padding(
                                //       padding: const EdgeInsets.only(top: 16),
                                //       child: Text('Error: ${snapshot.error}'),
                                //     )
                                //   ];
                                // } else {
                                //   children = const <Widget>[
                                //     SizedBox(
                                //       width: 60,
                                //       height: 60,
                                //       child: CircularProgressIndicator(),
                                //     ),
                                //     Padding(
                                //       padding: EdgeInsets.only(top: 16),
                                //       child: Text('Awaiting result...'),
                                //     )
                                //   ];
                                // }
                              },
                            ),

                            // FutureBuilder(,builder: builder)
                            // InkWell(
                            //   onTap: () {
                            //     _upload('camera');
                            //   },
                            //   child:

                            // CircleAvatar(
                            //   backgroundColor:
                            //       Color(0xffBD00FF).withOpacity(0.2),
                            //   radius: 50.0,
                            //   child:

                            //   CircleAvatar(
                            //     radius: 48.0,
                            //     child: ClipOval(
                            //         child: (imageurl == '')
                            //             ? Text('Choose Image')
                            //             : Image.network(imageurl)
                            //         // : Text('Choose Image')
                            //         // : Image.asset('assets/images/my.png')

                            //         // child: (_image != null)
                            //         // ? Image.file(_image)
                            //         //:
                            //         // child: Image.asset('assets/images/my.png'),
                            //         ),
                            //     backgroundColor: Colors.white,
                            //   ),
                            // ),
                            // ),
                            Container(
                              width: MediaQuery.of(context).size.width - 100,
                              child: Text('Email',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w200),
                                  textAlign: TextAlign.left),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: TextField(
                                enabled: false,
                                controller: emailController,
                                // obscureText: true,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
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
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100),
                                    hintText: "Email",
                                    fillColor: Colors.transparent),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width - 100,
                                child: Text('Name',
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w200),
                                    textAlign: TextAlign.left),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: TextField(
                                controller: nameController,
                                // enabled: false,
                                // obscureText: true,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
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
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100),
                                    hintText: "Enter Name",
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
                                        color: Colors.white,
                                        fontWeight: FontWeight.w200),
                                    textAlign: TextAlign.left),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: TextField(
                                controller: phoneController,
                                // obscureText: true,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
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
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100),
                                    hintText: "Enter Number",
                                    fillColor: Colors.transparent),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.05,
                            ),
                            TextButton(
                                onPressed: () async {
                                  // await FirebaseAuth.instance.signOut();
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => Login()));
                                  await auth
                                      ?.updateDisplayName(nameController.text);
                                  // await auth?.updatePhotoURL(imageurl);
                                  // await auth?.updatePhoneNumber();
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Colors.white, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(20.0))),
                                ),
                                child: Text(
                                  "Update Profile",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400),
                                )),
                          ],
                        ),
                      ),
                    ),
                    height * 0.88,
                    width * 0.9,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// void _openGallery(BuildContext context) async {
//   try {
//     final pickedFile = await ImagePicker().pickImage(
//         source: ImageSource.gallery,
//         maxWidth: MediaQuery.of(context).size.width / 6,
//         maxHeight: MediaQuery.of(context).size.height / 14);
//     setState(() {
//       imageFile = pickedFile!;
//     });

//     Navigator.pop(context);
//   } catch (e) {
//     print(e);
//   }
// }

// void _openCamera(BuildContext context) async {
//   try {
//     final pickedFile = await ImagePicker()
//         .pickImage(source: ImageSource.camera, maxWidth: 200, maxHeight: 200);
//     setState(() {
//       imageFile = pickedFile!;
//     });
//     Navigator.pop(context);
//   } catch (e) {
//     print(e);
//   }
// }

// dynamic _pickImageError;
// XFile? imageFile = null;
// Future<void> _showChoiceDialog(BuildContext context) {
//   return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(
//             "Choose option",
//             style: TextStyle(color: Colors.blue),
//           ),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: [
//                 Divider(
//                   height: 1,
//                   color: Colors.blue,
//                 ),
//                 ListTile(
//                   onTap: () {
//                     _openGallery(context);
//                   },
//                   title: Text("Gallery"),
//                   leading: Icon(
//                     Icons.account_box,
//                     color: Colors.blue,
//                   ),
//                 ),
//                 Divider(
//                   height: 1,
//                   color: Colors.blue,
//                 ),
//                 ListTile(
//                   onTap: () {
//                     _openCamera(context);
//                   },
//                   title: Text("Camera"),
//                   leading: Icon(
//                     Icons.camera,
//                     color: Colors.blue,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       });
// }

// return Card(
//   margin: const EdgeInsets.symmetric(vertical: 10),
//   child: ListTile(
//     dense: false,
//     leading: Image.network(image['url']),
//     title: Text(image['uploaded_by']),
//     subtitle: Text(image['description']),
//     trailing: IconButton(
//       onPressed: () => _delete(image['path']),
//       icon: const Icon(
//         Icons.delete,
//         color: Colors.red,
//       ),
//     ),
//   ),
// );
//           },
//         );
//       }

//       return const Center(
//         child: CircularProgressIndicator(),
//       );
//     },
//   ),
// ),

// InkWell(
//   onTap: () {
//     _showChoiceDialog(context);
//   },
//   child: CircleAvatar(
//     backgroundColor:
//         Color(0xffBD00FF).withOpacity(0.2),
//     radius: 50.0,
//     child: CircleAvatar(
//       radius: 48.0,
//       child: ClipOval(
//         child: (imageFile == null)
//             ? Text('Choose Image')
//             : Image.file(
//                 File(imageFile!.path),
//               ),
//         // : Image.asset('assets/images/my.png')

//         // child: (_image != null)
//         // ? Image.file(_image)
//         //:
//         // child: Image.asset('assets/images/my.png'),
//       ),
//       backgroundColor: Colors.white,
//     ),
//   ),
// ),

// Expanded(
//   child: FutureBuilder(
//     future: _loadImages(),
//     builder: (context,
//         AsyncSnapshot<List<Map<String, dynamic>>>
//             snapshot) {
//       if (snapshot.connectionState ==
//           ConnectionState.done) {
//         return ListView.builder(
//           itemCount: snapshot.data?.length ?? 0,
//           itemBuilder: (context, index) {
//             final Map<String, dynamic> image =
//                 snapshot.data![index];

// Future<List<Map<String, dynamic>>> _loadImages() async {
//   List<Map<String, dynamic>> files = [];

//   final ListResult result = await storage.ref().list();
//   final List<Reference> allFiles = result.items;

//   await Future.forEach<Reference>(allFiles, (file) async {
//     final String fileUrl = await file.getDownloadURL();
//     print(fileUrl);
//     final FullMetadata fileMeta = await file.getMetadata();
//     files.add({
//       "url": fileUrl,
//       "path": file.fullPath,
//       "uploaded_by": fileMeta.customMetadata?['uploaded_by'] ?? 'Nobody',
//       "description":
//           fileMeta.customMetadata?['description'] ?? 'No description'
//     });
//   });

//   return files;
// }
