import 'package:doangtnm/web/screens_for_web/VideosPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoThumbnail extends StatelessWidget{
  String imgUrl, views;
  VideoThumbnail(this.imgUrl,this.views);
  @override
  Widget build(BuildContext context) {
    return
        Container(
          color: Colors.transparent,
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
                Image.asset(imgUrl,fit: BoxFit.fitHeight,height: double.infinity,width: double.infinity,)
                ),
                Padding(
                  padding: const EdgeInsets.only(top:10,left: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child:
                  Row(
                    children: [
                      Icon(Icons.play_arrow_rounded,color: Colors.black,size: 30,),
                      Text(views,style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                      ))
                    ],
                  )
                  ),
                ),
              ],
            )

              ),
        );
  }
}