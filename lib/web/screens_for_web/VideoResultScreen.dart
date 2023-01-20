import 'package:flutter/material.dart';

import '../../pages/SearchResultPage.dart';
import '../../web/widgets_for_web/LeftPanel.dart';
import '../widgets_for_web/CustomAppBar.dart';

class VideoResultScreen extends StatefulWidget {
  @override
  _VideoResultScreenState createState() => _VideoResultScreenState();
}

class _VideoResultScreenState extends State<VideoResultScreen> {
  @override
  Widget build(BuildContext context) {
    GlobalKey currentKey = GlobalKey();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: currentKey,
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
        child:
          Row(
            children: [
                Flexible(
                  flex: 1,
                    fit: FlexFit.tight,
                    child: LeftPanel()),
                Flexible(
                  flex: 4,
                  fit: FlexFit.tight,
                  child: Container(
                    padding: EdgeInsets.only(left: 18, right: 18,top: 20),
                    height: size.height-80,
                    width: size.width * 0.8,
                    color: Colors.transparent,
                    child: SearchResultPage()
                  ),
                )
              ]
            )
      ),
    );
  }
}