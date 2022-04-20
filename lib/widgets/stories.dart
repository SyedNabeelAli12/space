import 'package:flooter/config/palette.dart';
import 'package:flooter/model/models.dart';
import 'package:flooter/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  Stories({Key? key, @required this.currentUser, @required this.stories})
      : super(key: key);

  final User? currentUser;
  final List<Story>? stories;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        itemCount: 1 + stories!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: _StoryCard(isAddStory: true, currentUsers: currentUser),
            );
          }
          final Story story = stories![index - 1];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: _StoryCard(story: story),
          );
        },
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  _StoryCard({Key? key, this.isAddStory = false, this.currentUsers, this.story})
      : super(key: key);

  final bool isAddStory;
  final User? currentUsers;
  final Story? story;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image(
            image: NetworkImage(isAddStory
                ? currentUsers!.imageUrl ?? ''
                : story!.imageUrl ?? ''),
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
              gradient: Palette.storyGradient,
              borderRadius: BorderRadius.circular(12)),
        ),
        Positioned(
            top: 4,
            bottom: 4,
            child: isAddStory
                ? Column(
                    children: [
                      Container(
                        height: 40.0,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: IconButton(
                          icon: const Icon(Icons.add),
                          padding: EdgeInsets.zero,
                          iconSize: 30,
                          color: Palette.facebookBlue,
                          onPressed: () {
                            print('add Stroy');
                          },
                        ),
                      ),
                    ],
                  )
                : ProfileAvatar(
                    imageUrl: story!.user!.imageUrl,
                    hasBorder: !story!.isViewed,
                  )),
        Positioned(
          bottom: 8,
          left: 8,
          right: 8,
          child: Text(
            isAddStory ? 'Add to Story' : story!.user!.name ?? '',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
