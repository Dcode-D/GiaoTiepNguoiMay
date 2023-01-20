import 'package:doangtnm/pages/CommentPage.dart';
import 'package:doangtnm/widgets/profile_image.dart';
import 'package:doangtnm/widgets/tik_tok_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:share_plus/share_plus.dart';

import 'package:doangtnm/widgets/LikeComponent.dart';
import 'package:doangtnm/widgets/column_social_icon.dart';

class RightHomeVideoPanel extends StatelessWidget {
  final String likes;
  final String comments;
  final String shares;
  final String profileImg;
  final String albumImg;
  const RightHomeVideoPanel({
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
    GlobalKey currentKey = GlobalKey();
    return Expanded(
      key: currentKey,
      child: Container(
        height: size.height,
        width: size.width/10,
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.3,
            ),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    LikeComponent(likes: likes),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 234, 234, 234),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: InkWell(
                          onTap: (){

                          },
                          child:
                            Icon(Icons.chat_bubble_outline,size: 30.0)),
                    ),
                    SizedBox(height: 5),
                    Text('100',style: TextStyle(
                        color: Colors.black, fontSize: 12,fontFamily: 'Inter', fontWeight: FontWeight.w700),),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 50,
                        width: 50,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 234, 234, 234),
                            borderRadius: BorderRadius.circular(30),
                      ),
                      child: InkWell(
                          onTap: (){
                            Share.share("something");
                          },
                          child:
                          Icon(Icons.near_me_outlined, size:30.0)),

                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}