import 'dart:io';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flooter/data/dart.dart';
import 'package:flooter/widgets/about_container.dart';
import 'package:flooter/widgets/profile_avatar.dart';
import 'package:flooter/widgets/profile_container.dart';

import 'package:image_picker/image_picker.dart';

import 'package:flooter/screens/login.dart';

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/foundation.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
      backgroundColor: Color(0xFFF0F2F5),
      body: Container(
        child: Stack(children: [
          Container(
            height: height / 3.5,
            width: width,
            child: Image(
              image: NetworkImage(currentUser.imageUrl ?? ''),
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            child: Positioned(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 70,
                child: CircleAvatar(
                  radius: 65,
                  backgroundImage: NetworkImage(currentUser.imageUrl ?? ''),
                ),
              ),
              top: height / 4.6,
              left: 140,
            ),
          ),

          // Padding(padding: const EdgeInsets.all(8)),
          Padding(
              padding: const EdgeInsets.only(top: 335),
              child: ProfileContainer(
                name: currentUser.name,
                short: 'Flutter Application Developer',
              ))
        ]),
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
