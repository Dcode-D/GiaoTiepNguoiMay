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
  bool isLiked = false;
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
                Container(


                  child: Center(
                    child: RotatedBox(
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
                  ),
                ),
                  Positioned(
                    right: 0.5,
                    child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.1),
                        ),
                        child: IconButton(onPressed: (){
                          int index = _tabController!.index-1;
                          if(index>=0)
                            _tabController!.animateTo(index);
                        }, icon: Icon(Icons.arrow_upward, size: 25, color: Colors.black,),
                          style: IconButton.styleFrom(
                            shape: CircleBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.1),
                        ),
                        child: IconButton(onPressed: (){
                          int index = _tabController!.index+1;
                          if(index<_tabController!.length)
                            _tabController!.animateTo(index);
                        }, icon: Icon(Icons.arrow_downward, size: 25, color: Colors.black,),
                          style: IconButton.styleFrom(
                            shape: CircleBorder(),
                          ),
                        ),
                      ),
                    SizedBox(height: 40,),
                    InkWell(
                      onTap: (){
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },
                      child: Column(
                          children:[
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black.withOpacity(0.1),
                              ),
                              child: Icon(
                                isLiked ? Icons.favorite : Icons.favorite_border,
                                color: isLiked ? Colors.red : Colors.black,
                                size: 30,
                              ),
                            ),
                            SizedBox(width: 2,),
                            Text(isLiked ? '77' : '76',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w600
                              ),),
                          ]
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.1),
                    ),
                      child: Icon(Icons.chat,
                        color: Colors.black,
                        size: 30,),
                    ),
                    SizedBox(height: 2,),
                    Text('23',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600
                      ),),
                    SizedBox(height: 10,),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.1),
                      ),
                      child: Icon(Icons.share,
                        color: Color.fromARGB(255, 242, 113, 33),
                        size: 30,),
                    ),
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
                  Navigator.pop(context);
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