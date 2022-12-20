import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class SongText extends StatelessWidget{
  String songname;
  SongText({required this.songname});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return
        Container(
          padding: EdgeInsets.only(top: 3,bottom: 3),
            constraints: BoxConstraints(maxWidth: size.width/2,
            ),
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)),
                                      color: Colors.grey.withOpacity(0.5),
            ),
            child:
            Row( children: [
              Icon(Icons.music_note,size: 17,color: Colors.white,),
              SizedBox(width: 5,),
              Flexible(child:
              SizedBox(
                  height: 20,
                  child:
              Marquee(text:songname ,style: TextStyle(
                color: Colors.white,
                fontSize: 14
              ),
                )
              )
              )],
            ),
    );
  }
}