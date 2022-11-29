import 'package:doangtnm/pages/commentpage.dart';
import 'package:doangtnm/widgets/profile_image.dart';
import 'package:doangtnm/widgets/tik_tok_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:share_plus/share_plus.dart';

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
                    InkWell(
                        onTap: (){
                          SmartDialog.show(builder: (_){
                            return
                            Container(
                              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/10),
                                child:
                              commentPage()
                            );
                          },
                          alignment: Alignment.bottomCenter,
                          );
                        },
                        child:
                    getIcons(TikTokIcons.chat_bubble, comments, 35.0)),
                    InkWell(
                        onTap: (){
                          Share.share("something");
                        },
                        child:
                          getIcons(TikTokIcons.reply, shares, 25.0)),
                    getAlbum(albumImg)
                  ],
                ))
          ],
        ),
      ),
    );
  }
}