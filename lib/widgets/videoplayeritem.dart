import 'package:doangtnm/events/showmore_event.dart';
import 'package:doangtnm/widgets/right_panel.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../theme/colors.dart';
import 'left_panel.dart';

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;
  final String name;
  final String caption;
  final String songName;
  final String profileImg;
  final String likes;
  final String comments;
  final String shares;
  final String albumImg;
  VideoPlayerItem(
      {Key? key,
        required this.size,
        required this.name,
        required this.caption,
        required this.songName,
        required this.profileImg,
        required this.likes,
        required this.comments,
        required this.shares,
        required this.albumImg,
        required this.videoUrl})
      : super(key: key);

  final Size size;

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  VideoPlayerController? _videoController;
  bool isShowPlaying = false;
  late EventBus eventbus;
  bool ishowingmore = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eventbus = new EventBus();
    eventbus.on<ShowmoreEvent>().listen((event) {setState(() {
      ishowingmore= event.isshowingmore;
    });});

    _videoController = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((value) {
        _videoController!.play();
        setState(() {

          isShowPlaying = false;
        });
      });


  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoController!.dispose();


  }
  Widget isPlaying(){
    return _videoController!.value.isPlaying && !isShowPlaying  ? Container() : Icon(Icons.play_arrow,size: 80,color: white.withOpacity(0.7),);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _videoController!.value.isPlaying
              ? _videoController!.pause()
              : _videoController!.play();
        });
      },
      child: RotatedBox(
        quarterTurns: -1,
        child: Container(
            height: widget.size.height,
            width: widget.size.width,
            child: Stack(
              children: <Widget>[
                Container(
                  height: widget.size.height,
                  width: widget.size.width,
                  decoration: BoxDecoration(color: black),
                  child: Stack(
                    children: <Widget>[
                      VideoPlayer(_videoController!),
                      Center(
                        child: Container(
                          child: isPlaying(),
                        ),
                      ),
                      ishowingmore?

                      Container(
                        color: Colors.black.withOpacity(0.5),
                      ):
                      Container()
                    ],
                  ),
                ),
                Container(
                  height: widget.size.height,
                  width: widget.size.width,
                  child: Padding(
                    padding:
                    const EdgeInsets.only(left: 15, top: 20, bottom: 10),
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                              child: Row(
                                children: <Widget>[

                                  LeftPanel(
                                    size: widget.size,
                                    name: "${widget.name}",
                                    caption: "${widget.caption}",
                                    songName: "${widget.songName}",
                                    eventBus: eventbus,
                                  ),
                                  RightPanel(
                                    size: widget.size,
                                    likes: "${widget.likes}",
                                    comments: "${widget.comments}",
                                    shares: "${widget.shares}",
                                    profileImg: "${widget.profileImg}",
                                    albumImg: "${widget.albumImg}",
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

