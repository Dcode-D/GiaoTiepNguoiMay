import 'package:doangtnm/events/RemoteShowmoreEvent.dart';
import 'package:doangtnm/events/ShowmoreEvent.dart';
import 'package:doangtnm/widgets/customreadmore.dart';
import 'package:doangtnm/widgets/song_text.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:doangtnm/theme/Colors.dart';

import '../pages/OtherProfilePage.dart';


class LeftPanel extends StatelessWidget {
  final String name;
  final String caption;
  final String songName;
  late final CustomReadmore myreadmore;
  bool isshowingmore = false;
  LeftPanel({
     Key? key,
    required this.size,
    required this.name,
    required this.caption,
    required this.songName,
    required this.eventBus
  }) : super(key: key);

  EventBus eventBus;
  final Size size;


  @override
  Widget build(BuildContext context) {
    myreadmore = CustomReadmore(
      caption,
      trimMode: TrimMode.Line,
      trimLines: 3,
      style: TextStyle(color: white,fontSize: 14),
      callback: (value){
        eventBus.fire(ShowmoreEvent(!value));
        print(value);
      },
      textEventBus: this.eventBus,
    );

    return Container(
      width: size.width * 0.8,
      height: size.height,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            onTap: (){
              Navigator.push(context, PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => OtherProfileScreen(),
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
            child: Text(
              name,
              style: TextStyle(
                  color: white, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height*0.7),
              child:
          SingleChildScrollView(
            child:
          myreadmore,

          )
          ),
          SizedBox(
            height: 5,
          ),

          Container(
            margin: EdgeInsets.only(left: 0),
            child:
            SongText(songname: songName,),
          )
        ],
      ),
    );
  }
}