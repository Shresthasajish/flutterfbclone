import 'package:facebook/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:facebook/models/models.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({
    required Key key,
    required this.currentUser,
  }): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(key : UniqueKey(),imageUrl: currentUser.imageUrl,),
              const SizedBox(width: 8.0,),
              Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: 'What\'s on your mind?',
                    ),
                  )
              )
            ],
          ),
          const Divider(height: 10.0, thickness: 0.5,),
          Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  onPressed: () => print('Live'),
                  icon: const Icon(
                    Icons.videocam,
                    color: Colors.red,
                  ),
                  label: Text('Live',
                  style: const TextStyle(
                    color: Colors.black,
                  ),),
                ),
                const VerticalDivider(width: 8.0,),
                TextButton.icon(
                  onPressed: () => print('Photo'),
                  icon: const Icon(
                    Icons.photo_library,
                    color: Colors.green,
                  ),
                  label: Text('Photo',
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                const VerticalDivider(width: 8.0,),
                TextButton.icon(
                  onPressed: () => print('Room'),
                  icon: const Icon(
                    Icons.video_call,
                    color: Colors.purpleAccent,
                  ),
                  label: Text('Room',
                    style: const TextStyle(
                      color: Colors.black,
                    ),),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
