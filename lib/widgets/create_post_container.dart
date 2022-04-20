import 'package:flooter/model/models.dart';
import 'package:flooter/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  CreatePostContainer({Key? key, @required this.currentUser}) : super(key: key);

  final User? currentUser;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(imageUrl: currentUser!.imageUrl),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                        hintText: "What's on your mind?"),
                  ),
                ),
              ],
            ),
            Divider(
              height: 10,
              thickness: 0.2,
              color: Colors.grey,
            ),
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton.icon(
                      onPressed: () {
                        print('live');
                      },
                      icon: Icon(
                        Icons.videocam,
                        color: Colors.red,
                      ),
                      label: Text('Live')),
                  VerticalDivider(
                    thickness: 0.2,
                    width: 8,
                    color: Colors.grey,
                  ),
                  FlatButton.icon(
                      onPressed: () {
                        print('Photo');
                      },
                      icon: Icon(
                        Icons.photo_library,
                        color: Colors.green,
                      ),
                      label: Text('Photo')),
                  VerticalDivider(
                    thickness: 0.2,
                    width: 8,
                    color: Colors.grey,
                  ),
                  FlatButton.icon(
                      onPressed: () {
                        print('Room');
                      },
                      icon: Icon(
                        Icons.video_call,
                        color: Colors.purpleAccent,
                      ),
                      label: Text('Room')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
