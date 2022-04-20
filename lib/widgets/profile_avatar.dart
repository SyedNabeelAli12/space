import 'package:flooter/config/palette.dart';
import 'package:flooter/data/dart.dart';
import 'package:flooter/model/models.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  ProfileAvatar(
      {Key? key,
      @required this.imageUrl,
      this.isActive = false,
      this.hasBorder = false})
      : super(key: key);

  final String? imageUrl;
  final bool isActive;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Palette.facebookBlue,
          child: CircleAvatar(
            radius: hasBorder ? 18 : 20,
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(imageUrl ?? ''),
          ),
        ),
        isActive
            ? Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      color: Palette.online,
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.white),
                    )))
            : const SizedBox.shrink()
      ],
    );
  }
}
