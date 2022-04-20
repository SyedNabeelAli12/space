import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton(
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
          BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon),
          iconSize: iconSize,
          color: Colors.black),
    );
  }
}
