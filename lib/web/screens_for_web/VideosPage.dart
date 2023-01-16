import 'package:doangtnm/web/widgets_for_web/VideoRightPanelComments.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../constant/data_json.dart';
import '../../widgets/videoplayeritem.dart';

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
    Scaffold(
    body:
        Stack(
          children:<Widget> [
            Row(
            children:[
              Flexible(
                flex:2,
                child:
                Stack(
                  alignment: Alignment.center,
                  children:[
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
                  Positioned(
                    right: 0,
                    child:
                  Column(children: [
                      IconButton(onPressed: (){
                        int index = _tabController!.index-1;
                        if(index>=0)
                          _tabController!.animateTo(index);
                      }, icon: Icon(Icons.arrow_upward, size: 25, color: Colors.black,),
                        style: IconButton.styleFrom(
                          shape: CircleBorder(),
                        ),
                      ),
                      IconButton(onPressed: (){
                        int index = _tabController!.index+1;
                        if(index<_tabController!.length)
                          _tabController!.animateTo(index);
                      }, icon: Icon(Icons.arrow_downward, size: 25, color: Colors.black,),
                        style: IconButton.styleFrom(
                          shape: CircleBorder(),
                        ),
                      )
                    ],),
                  )
                  ]
              )
              ),
          Flexible(
              flex: 1,
              child:
                  Center(
                      child:
            RightPanelComments()
                  )
          )]
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children:[
              InkWell(
                onTap: (){

                },
                  child: Icon(Icons.close, size: 50, color: Colors.black,)),
              SizedBox(width: 10,),
              Image.asset('assets/images/logoonly.jpg', width: 48, height: 48,),
            ]
              ),
        )
          ]
        )
    );
  }
}