import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook/config/palette.dart';
import 'package:facebook/models/story_model.dart';
import 'package:facebook/models/user_model.dart';
import 'package:facebook/widgets/profile_avatar.dart';
import  'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  const Stories({
    required Key key,
    required this.currentUser,
    required this.stories,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
        color: Colors.white,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + stories.length,
          itemBuilder: (BuildContext context, int index){
            if(index == 0){
              final Story story = stories[index ];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: _StoryCard(
                  key: UniqueKey(),
                  isAddStory: true,
                  currentUser: currentUser,
                  story: story,
                ),
              );

            }
            final Story story = stories[index -1];
            return Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 4.0),
              child: _StoryCard(key: UniqueKey() ,story: story, currentUser: currentUser,),
            );
          }),
    );
  }
}

class _StoryCard extends StatelessWidget {

  final bool isAddStory;
  final User  currentUser;
  final Story story;

  const _StoryCard({
    required Key key,
    this.isAddStory = false,
    required this.currentUser,
    required this.story
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(imageUrl: isAddStory ? currentUser.imageUrl : story.imageUrl,
          height: double.infinity,
          width: 110.0,
          fit: BoxFit.cover,),
        ),
        Container(
          height: double.infinity,
          width: 110.0,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        Positioned(top: 8.0,
        left: 8.0,
        child: isAddStory ? Container(
          height: 40.0,
            width: 40.0,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: IconButton(padding: EdgeInsets.zero,
          icon: const Icon(Icons.add),
          iconSize: 30.0,
          color: Palette.facebookBlue,
          onPressed: () => print('Add to Story'),),
        ): ProfileAvatar(key: UniqueKey(),
            imageUrl: story.imageUrl,
            hasBorder: !story.isViewed,
        ),
        ),
        Positioned(bottom: 8.0,
            left: 8.0,
            right: 8.0,
        child: Text(isAddStory ? "Add to Story" : story.user.name,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        maxLines: 2,
            overflow: TextOverflow.ellipsis,
        ),

        )
      ],
    );
  }
}

