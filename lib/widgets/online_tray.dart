import 'package:flooter/config/palette.dart';
import 'package:flooter/data/dart.dart';
import 'package:flooter/model/models.dart';
import 'package:flooter/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class OnlineTray extends StatelessWidget {
  OnlineTray({Key? key, @required this.onlineUsers}) : super(key: key);

  final List<User>? onlineUsers;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
          scrollDirection: Axis.horizontal,
          itemCount: onlineUsers!.length,
          itemBuilder: (BuildContext context, int index) {
            // if (index == 0) {
            //   return Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //     child: _CreateRoomButton(),
            //   );
            // }
            final User user = onlineUsers![index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ProfileAvatar(
                imageUrl: user.imageUrl,
                isActive: true,
              ),
            );
          }),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () {
        print('Create Room');
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: Colors.white,
      borderSide: BorderSide(
        width: 3,
        color: Color.fromARGB(255, 130, 177, 253),
      ),
      textColor: Palette.facebookBlue,
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: Icon(
              Icons.video_call,
              size: 35.0,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Text('Create\nRoom ')
        ],
      ),
    );
  }
}
