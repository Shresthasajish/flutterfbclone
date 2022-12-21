import 'package:facebook/config/palette.dart';
import 'package:facebook/models/models.dart';
import 'package:facebook/widgets/widgets.dart';
import 'package:facebook/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:facebook/models/post_model.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle.light,
            backgroundColor: Colors.white,
            title: Text('facebook',
              style: const TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),

            ),
            centerTitle: false,
            floating: true,
            actions: [
              CircleButton( key: UniqueKey(), icon: Icons.search, iconSize: 30.0, onPressed: ()=> print('Search')),
              CircleButton( key: UniqueKey(), icon: MdiIcons.facebookMessenger, iconSize: 30.0, onPressed: ()=> print('Messenger')),
            ],
          ),
          SliverToBoxAdapter(
              child: CreatePostContainer(key: UniqueKey(),currentUser: currentUser),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Rooms(key: UniqueKey(), onlineUsers: onlineUsers),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Stories(currentUser: currentUser, stories: stories, key: UniqueKey()),
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate((context, index){
            final Post post = posts[index];
            return PostContainer(key : UniqueKey(), post: post);
          }))

        ],
      )
    );
  }
}
