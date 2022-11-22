import 'package:doangtnm/widgets/LikeComponent.dart';
import 'package:flutter/material.dart';
import 'package:doangtnm/constant/data_json.dart';
import 'package:doangtnm/theme/colors.dart';
import 'package:doangtnm/widgets/column_social_icon.dart';
import 'package:doangtnm/widgets/left_panel.dart';
import 'package:doangtnm/widgets/tik_tok_icons.dart';
import 'package:video_player/video_player.dart';

import '../widgets/header_home_page.dart';
import '../widgets/videoplayeritem.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(length: videoitems.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return
      Stack(
    children:<Widget>[
      RotatedBox(
      quarterTurns: 1,
      child: TabBarView(
        controller: _tabController,
        children: List.generate(videoitems.length, (index) {
          return VideoPlayerItem(
            videoUrl: videoitems[index]['videoUrl'],
            size: size,
            name: videoitems[index]['name'],
            caption: videoitems[index]['caption'],
            songName: videoitems[index]['songName'],
            profileImg: videoitems[index]['profileImg'],
            likes: videoitems[index]['likes'],
            comments: videoitems[index]['comments'],
            shares: videoitems[index]['shares'],
            albumImg: videoitems[index]['albumImg'],
          );
        }),
      ),
    ),
      Container(
          padding: EdgeInsets.only(top: 30),
          child:
          Align(
              alignment: Alignment.topCenter,
              child:
              HeaderHomePage())
      )
    ]
      );
  }
}


