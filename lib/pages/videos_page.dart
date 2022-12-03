import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/data_json.dart';
import '../widgets/videoplayeritem.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
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
                    alignment: Alignment.topLeft,
                    child:
                        InkWell(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child:
                    Icon(Icons.arrow_back_ios_new,size: 25,color: Colors.white,))
                )
            )
          ]
    );
  }
}