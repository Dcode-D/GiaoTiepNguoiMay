import 'package:doangtnm/events/showmore_event.dart';
import 'package:doangtnm/widgets/song_text.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:doangtnm/theme/colors.dart';
import 'package:readmore/readmore.dart';

class LeftPanel extends StatelessWidget {
  final String name;
  final String caption;
  final String songName;
  bool isshowingmore = false;
  LeftPanel({
     Key? key,
    required this.size,
    required this.name,
    required this.caption,
    required this.songName,
    required this.eventBus
  }) : super(key: key);

  late EventBus eventBus;
  final Size size;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.8,
      height: size.height,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            style: TextStyle(
                color: white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height*0.7),
              child:
          SingleChildScrollView(
            child:
          ReadMoreText(
            caption,
            trimMode: TrimMode.Line,
            trimLines: 3,
            style: TextStyle(color: white,fontSize: 14),
            callback: (value){
              eventBus.fire(ShowmoreEvent(!value));
              print(value);
            },
          )
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