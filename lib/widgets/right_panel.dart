import 'package:doangtnm/widgets/profile_image.dart';
import 'package:doangtnm/widgets/tik_tok_icons.dart';
import 'package:flutter/cupertino.dart';

import 'LikeComponent.dart';
import 'column_social_icon.dart';

class RightPanel extends StatelessWidget {
  final String likes;
  final String comments;
  final String shares;
  final String profileImg;
  final String albumImg;
  const RightPanel({
    Key? key,
    required this.size,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.profileImg,
    required this.albumImg,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: size.height,
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.3,
            ),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ProfileImage(imgurl: profileImg),
                    LikeComponent(likes: likes),
                    getIcons(TikTokIcons.chat_bubble, comments, 35.0),
                    getIcons(TikTokIcons.reply, shares, 25.0),
                    getAlbum(albumImg)
                  ],
                ))
          ],
        ),
      ),
    );
  }
}