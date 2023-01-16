import 'package:doangtnm/web/widgets_for_web/AccountItem.dart';
import 'package:doangtnm/web/widgets_for_web/CustomAppBar.dart';
import 'package:doangtnm/web/widgets_for_web/LeftPanel.dart';
import 'package:doangtnm/web/widgets_for_web/MusicTagItem.dart';
import 'package:doangtnm/web/widgets_for_web/TagItem.dart';
import 'package:flutter/material.dart';

import '../../widgets/video_thumbnail.dart';

class TagNameScreen extends StatefulWidget {
  @override
  const TagNameScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TagNameScreenState();
  }
}

class _TagNameScreenState extends State<TagNameScreen> {
  int tab = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: <Widget>[
              CustomAppBar(),
              Row(
                children: [
                  LeftPanel(),
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(left: 18, right: 18,top: 20),
                      height: size.height-80,
                      width: size.width * 0.8,
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              children:[
                                Image.asset("assets/images/cat4.jpg", width: 150, height: 150,),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:[
                                      Row(
                                        children: [
                                          Text(
                                              "Chill Lofi",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 30,
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.w700
                                              )
                                          ),
                                          SizedBox(
                                            width: 100,
                                          ),
                                          Icon(Icons.share, color: Color.fromARGB(
                                              255, 242, 113, 33),
                                            size: 30,)
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                            "2.3M Views",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w500
                                            )
                                        ),
                                      ),
                                      SizedBox(
                                        height: 75,
                                      ),
                                    ]
                                )
                              ]
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                              "Lofi hip hop radio - beats to relax/study to",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w400
                              )
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 1.5,
                            width: size.width * 0.8,
                            color: Colors.black.withOpacity(0.1),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              width: size.width * 0.8,
                              height: size.height - 331,
                            child: SingleChildScrollView(
                              child: GridView.builder(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 15,
                                gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 5,
                                  childAspectRatio: 1,
                                  crossAxisSpacing: 35,
                                  mainAxisSpacing: 20,
                                ),
                                itemBuilder: (context, index) {
                                  return
                                    Column(
                                      children: [
                                        SizedBox(
                                            height:MediaQuery.of(context).size.height/4,
                                            width: MediaQuery.of(context).size.width/2.1,
                                            child: VideoThumbnail("assets/images/cat1.jpg", "1.5M")),
                                        SizedBox(height: 2,),
                                        Flexible(child:
                                        Text("How i met your mother and something came at us!",
                                          style: TextStyle(fontSize: 12,
                                              color: Colors.black,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500),
                                          overflow: TextOverflow.ellipsis,)),
                                      ],
                                    );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
      ),
    );
  }
}