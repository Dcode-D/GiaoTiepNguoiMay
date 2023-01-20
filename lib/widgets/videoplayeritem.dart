
import 'package:doangtnm/events/RemoteShowmoreEvent.dart';
import 'package:doangtnm/events/ShowmoreEvent.dart';
import 'package:doangtnm/widgets/right_panel.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../theme/Colors.dart';
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
  bool manualstop = false;
  ValueNotifier<bool> _notifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((value) {
        _videoController!.pause();
        setState(() {
          isShowPlaying = false;
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _videoController!.dispose();


  }
  Widget isPlaying(){
    return _videoController!.value.isPlaying && !isShowPlaying  ? Container() : Icon(Icons.play_arrow,size: 80,color: white.withOpacity(0.7),);
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: GlobalKey(),
      onVisibilityChanged: (visi){
        if(visi.visibleFraction<0.5)
          {
            _notifier.value = !_notifier.value;
            manualstop = false;
            _videoController!.pause();
          }
        if(visi.visibleFraction>=0.5 && !manualstop)
          {
            _notifier.value = !_notifier.value;
            _videoController!.play();
          }
      },
      child: InkWell(
        splashFactory: NoSplash.splashFactory,
        onTap: () {
          _notifier.value=!_notifier.value;
            if(_videoController!.value.isPlaying)
                { _videoController!.pause();
                  manualstop = true;
                }
                else{ _videoController!.play();
                      manualstop = false;
                }
        },
        child:
        IgnorePointer(
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
                      decoration: BoxDecoration(color: Colors.white),
                      child: Stack(
                        children: <Widget>[
                          Center(child: VideoPlayer(_videoController!)),
                          Center(
                            child: ValueListenableBuilder(
                              valueListenable: _notifier,
                              builder:(context,value,_)=> Container(
                                child: isPlaying(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

