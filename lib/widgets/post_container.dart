import 'package:flooter/config/palette.dart';
import 'package:flooter/model/models.dart';
import 'package:flooter/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  PostContainer({Key? key, @required this.post}) : super(key: key);

  final Post? post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(post: post),
                SizedBox(
                  height: 4,
                ),
                Text(post!.caption ?? ''),
                post!.imageUrl != null
                    ? const SizedBox.shrink()
                    : const SizedBox(height: 6)
              ],
            ),
          ),
          (post!.imageUrl != null)
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Image(image: NetworkImage(post!.imageUrl ?? '')),
                )
              : SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: _PostStats(post: post),
          )
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  const _PostHeader({Key? key, @required this.post}) : super(key: key);

  final Post? post;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post!.user!.imageUrl),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post!.user!.name ?? '',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    '${post!.timeAgo}  * ',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12,
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(
            onPressed: () {
              print('more');
            },
            icon: Icon(Icons.more_horiz))
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  const _PostStats({Key? key, @required this.post}) : super(key: key);

  final Post? post;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Palette.facebookBlue, shape: BoxShape.circle),
                child: Icon(
                  Icons.thumb_up_alt,
                  size: 10,
                  color: Colors.white,
                )),
            const SizedBox(
              width: 4.0,
            ),
            Expanded(
              child: Text(
                "${post!.likes}",
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "${post!.comments} Comments",
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "${post!.shares} Shares",
              style: TextStyle(color: Colors.grey[600]),
            )
          ],
        ),
        const Divider(),
        Row(
          children: [
            _PostButton(
                icon: Icon(
                  MdiIcons.thumbUpOutline,
                  color: Colors.grey[600],
                  size: 20,
                ),
                label: 'Like',
                onTap: () => print('Like')),
            _PostButton(
                icon: Icon(
                  MdiIcons.commentOutline,
                  color: Colors.grey[600],
                  size: 20,
                ),
                label: 'Comment',
                onTap: () => print('Comment')),
            _PostButton(
                icon: Icon(
                  MdiIcons.shareOutline,
                  color: Colors.grey[600],
                  size: 25,
                ),
                label: 'Share',
                onTap: () => print('Share')),
          ],
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  _PostButton(
      {Key? key,
      @required this.icon,
      @required this.label,
      @required this.onTap})
      : super(key: key);

  final Icon? icon;
  final String? label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(child: icon),
                  SizedBox(
                    width: 4,
                  ),
                  Text('$label'),
                ],
              ),
            )),
      ),
    );
  }
}
