import 'package:firebase_auth/firebase_auth.dart';
import 'package:flooter/config/palette.dart';
import 'package:flooter/screens/signin.dart';
import 'package:flooter/widgets/about_container.dart';
import 'package:flooter/widgets/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({Key? key, this.name, this.short}) : super(key: key);

  final String? name;
  final String? short;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$name',
                    style: TextStyle(fontSize: 30),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      '$short',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleProfileButton(
                      icon: (Icons.facebook),
                      iconSize: 30,
                      onPressed: () {
                        print('facebook');
                      }),
                  CircleProfileButton(
                      icon: (MdiIcons.github),
                      iconSize: 30,
                      onPressed: () {
                        print('github');
                      }),
                  CircleProfileButton(
                      icon: (MdiIcons.twitter),
                      iconSize: 30,
                      onPressed: () {
                        print('twitter');
                      }),
                  CircleProfileButton(
                      icon: (MdiIcons.stackOverflow),
                      iconSize: 30,
                      onPressed: () {
                        print('twitter');
                      }),
                ],
              ),
              Divider(
                thickness: 0.2,
              ),
              Container(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            '39',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w500),
                          ),
                          Text('Projects')
                        ],
                      ),
                      VerticalDivider(
                        thickness: 0.5,
                        width: 2,
                      ),
                      Column(
                        children: [
                          Text(
                            '523',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w500),
                          ),
                          Text('Followings')
                        ],
                      ),
                      VerticalDivider(
                        thickness: 0.5,
                        width: 2,
                      ),
                      Column(
                        children: [
                          Text(
                            '5379',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w500),
                          ),
                          Text('Followers')
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 0.2,
              ),
              AboutContainer(
                description:
                    'Flutter Developer | Always do good, and you’ll see the good, not just in things around you, but also in everyone and yourself as well',
              ),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.002,
        ),
        Card(
          color: Colors.white,
          child: ListTile(
            title: Text(
              'Current User Logout',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
            ),
            onTap: () async {
              print('object');
              try {
                await FirebaseAuth.instance.signOut();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignIn()));
              } catch (e) {
                print(e);
              }
            },
            trailing: CircleButton(
              icon: Icons.logout,
              iconSize: 24,
              onPressed: () async {
                // try {
                //   await FirebaseAuth.instance.signOut();
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => SignIn()));
                // } catch (e) {
                //   print(e);
                // }
                print('object');
              },
            ),
          ),
        ),
        // Container(
        //   color: Colors.white,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     children: [
        //       Text(
        //         'Current User Logout',
        //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
        //       ),
        //       MaterialButton(
        //         height: 50,
        //         elevation: 0,
        //         shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(20)),
        //         color: Palette.facebookBlue,
        //         onPressed: () async {
        //           // try {
        //           //   await FirebaseAuth.instance.signOut();
        //           //   Navigator.push(context,
        //           //       MaterialPageRoute(builder: (context) => SignIn()));
        //           // } catch (e) {
        //           //   print(e);
        //           // }
        //         },
        //         child: const Text(
        //           'Logout',
        //           style: TextStyle(fontSize: 24, color: Colors.white),
        //         ),
        //       ),
        //     ],
        //   ),
        // )
      ],
    );
  }
}

class CircleProfileButton extends StatelessWidget {
  const CircleProfileButton(
      {Key? key,
      @required this.icon,
      @required this.iconSize,
      @required this.onPressed})
      : super(key: key);

  final IconData? icon;
  final double? iconSize;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      decoration:
          BoxDecoration(color: Palette.facebookBlue, shape: BoxShape.circle),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon),
          iconSize: iconSize,
          color: Colors.white),
    );
  }
}
