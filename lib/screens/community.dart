import 'package:flooter/config/palette.dart';
import 'package:flooter/data/dart.dart';
import 'package:flooter/model/models.dart';
import 'package:flooter/widgets/circle_button.dart';
import 'package:flooter/widgets/post_container.dart';
import 'package:flooter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeCommunity extends StatefulWidget {
  const HomeCommunity({Key? key}) : super(key: key);

  @override
  State<HomeCommunity> createState() => _HomeCommunityState();
}

class _HomeCommunityState extends State<HomeCommunity> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xFFF0F2F5),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: height * 0.065,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Text(
            'Space',
            style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: width * 0.07,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2),
          ),
          centerTitle: false,
          elevation: 0,
          actions: [
            CircleButton(
                icon: Icons.search,
                iconSize: width * 0.07,
                onPressed: () {
                  print('search');
                }),
            CircleButton(
                icon: MdiIcons.facebookMessenger,
                iconSize: width * 0.07,
                onPressed: () {
                  print('Messenger');
                })
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              children: [
                CreatePostContainer(currentUser: currentUser),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 10, 0, 5.0),
                  child: Rooms(onlineUsers: onlineUsers),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 10, 0, 5.0),
                  child: Stories(
                    currentUser: currentUser,
                    stories: stories,
                  ),
                ),
                Container(
                  height: height * 0.45,
                  child: CustomScrollView(slivers: [
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                      final Post post = posts[index];
                      return PostContainer(post: post);
                    }, childCount: posts.length))
                  ]),
                ),
              ],
            ),
          ),
        ));
  }
}
