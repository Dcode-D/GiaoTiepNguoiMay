import 'package:doangtnm/pages/videos_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoThumbnail extends StatelessWidget{
  String imgUrl, views;
  VideoThumbnail(this.imgUrl,this.views);
  @override
  Widget build(BuildContext context) {
    return
        Container(
          child:
              InkWell(
                onTap: (){

                  Navigator.of(context, rootNavigator: true).push( PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => VideoPage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0);
                      const end = Offset.zero;
                      const curve = Curves.ease;

                      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ));
                },
                child:
            Stack(
              children: [
                Positioned.fill(child:
                Image.asset(imgUrl,fit: BoxFit.fill,height: double.infinity,width: double.infinity,)
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child:
                Row(
                  children: [
                    Icon(Icons.play_arrow_outlined,color: Colors.white,size: 25,),
                    Text(views,style: TextStyle(color: Colors.white),)
                  ],
                )
                )
              ],
            )
              )
          ,
        );
  }
}