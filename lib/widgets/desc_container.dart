import 'package:flooter/model/models.dart';
import 'package:flooter/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DescripContainer extends StatelessWidget {
  DescripContainer({Key? key, @required this.currentUser}) : super(key: key);

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
                  child: Text(
                    // decoration: InputDecoration.collapsed(
                    //     hintText: "What's on your mind?"),
                    '${currentUser!.name}',
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
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      child: Row(
                        children: [
                          FlatButton.icon(
                            onPressed: () {
                              print('live');
                            },
                            icon: Icon(
                              Icons.image,
                              color: Colors.green,
                            ),
                            label: Text(
                              'Image',
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                          ),
                          VerticalDivider(
                            thickness: 0.1,
                            width: 1,
                            color: Colors.grey,
                          ),
                          FlatButton.icon(
                            onPressed: () {
                              print('live');
                            },
                            icon: Icon(
                              MdiIcons.information,
                              color: Colors.red,
                            ),
                            label: Text(
                              'Name',
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                          ),
                          VerticalDivider(
                            thickness: 0.1,
                            width: 1,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ),
                  FlatButton.icon(
                    onPressed: () {
                      print('live');
                    },
                    icon: Icon(
                      Icons.price_change,
                      color: Color.fromRGBO(225, 203, 1, 1),
                    ),
                    label: Text(
                      'Price',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
