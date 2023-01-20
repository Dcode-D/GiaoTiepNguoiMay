import 'package:doangtnm/constant/data_json.dart';
import 'package:doangtnm/web/widgets_for_web/AccountItem.dart';
import 'package:doangtnm/web/widgets_for_web/CustomAppBar.dart';
import 'package:doangtnm/web/widgets_for_web/LeftPanel.dart';
import 'package:doangtnm/web/widgets_for_web/MusicTagItem.dart';
import 'package:doangtnm/web/widgets_for_web/TagItem.dart';
import 'package:doangtnm/web/widgets_for_web/VideoRightPanelComments.dart';
import 'package:doangtnm/widgets/right_panel.dart';
import 'package:doangtnm/widgets/videoplayeritem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';





class HomeScreen extends StatefulWidget {
  @override
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      builder: FlutterSmartDialog.init(),
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height/10),
          child: CustomAppBar(),
        ),
        body: Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                Flexible(child:
                  Row(
                    children: [
                      LeftPanel(),
                      Container(
                        width: size.width*0.45,
                        height: size.height-86.5,
                        child: SingleChildScrollView(
                          child: Column(
                            children: List.generate(3, (index) =>
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: RotatedBox(
                                          quarterTurns: 1,
                                          child: VideoPlayerItem(
                                            videoUrl: videoitems[index]['videoUrl'],
                                            size: new Size(size.width/2.5, size.height),
                                            name: videoitems[index]['name'],
                                            caption: videoitems[index]['caption'],
                                            songName: videoitems[index]['songName'],
                                            profileImg: videoitems[index]['profileImg'],
                                            likes: videoitems[index]['likes'],
                                            comments: videoitems[index]['comments'],
                                            shares: videoitems[index]['shares'],
                                            albumImg: videoitems[index]['albumImg'],
                                          ),
                                        ),
                                      ),
                                      RightPanel(
                                          size: size,
                                          likes: "123M",
                                          comments: "46K",
                                          shares: "4.5K",
                                          profileImg: "assets/images/cat1.jpg",
                                          albumImg: "something",
                                        ),
                                    ],
                                  ),
                                )
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: size.height-86.5,
                        width: size.width*0.35,
                        child: RightPanelComments(),
                      )
                    ],
                  )
                )
              ],
            )
          ),
        ),
    );
  }
}