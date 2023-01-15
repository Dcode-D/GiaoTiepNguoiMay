import 'package:doangtnm/web/widgets_for_web/AccountItem.dart';
import 'package:doangtnm/web/widgets_for_web/CustomAppBar.dart';
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
                  Container(
                      padding: EdgeInsets.only(left: 50, right: 50, top: 30),
                      height: size.height-80,
                      width: size.width * 0.2,
                      color: Colors.transparent,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            InkWell(
                                onTap: (){
                                  setState(() {
                                    tab=0;
                                  });},
                                child:
                                Row(
                                  children: [
                                    Icon(
                                        Icons.home_outlined,
                                        color: (tab==0)? Color.fromARGB(255, 242, 113, 33) : Colors.black.withOpacity(0.7),
                                        size: (tab==0)? 37: 35
                                    ),
                                    SizedBox(width: 17,),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        "For You",
                                        style:(tab==0)? TextStyle(
                                            color: Color.fromARGB(255, 242, 113, 33), fontSize: 22, fontWeight: FontWeight.bold):
                                        TextStyle(
                                          color: Colors.black.withOpacity(0.7),
                                          fontSize: 20,
                                        )
                                        ,
                                      ),
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            InkWell(
                                onTap: (){
                                  setState(() {
                                    tab=1;
                                  });},
                                child:
                                Row(
                                  children: [
                                    Icon(
                                        Icons.people_outline,
                                        color: (tab==1)? Color.fromARGB(255, 242, 113, 33) : Colors.black.withOpacity(0.7),
                                        size: (tab==1)? 37: 35
                                    ),
                                    SizedBox(width: 17,),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        "Following",
                                        style:(tab==1)? TextStyle(
                                            color: Color.fromARGB(255, 242, 113, 33),
                                            fontSize: 22, fontWeight: FontWeight.bold):
                                        TextStyle(
                                          color: Colors.black.withOpacity(0.7),
                                          fontSize: 20,
                                        )
                                        ,
                                      ),
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            InkWell(
                                onTap: (){
                                  setState(() {
                                    tab=2;
                                  });},
                                child:
                                Row(
                                  children: [
                                    Icon(
                                        Icons.cast_outlined,
                                        color: (tab==2)? Color.fromARGB(255, 242, 113, 33) : Colors.black.withOpacity(0.7),
                                        size: (tab==2)? 37: 35
                                    ),
                                    SizedBox(width: 17,),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        "Live",
                                        style:(tab==2)? TextStyle(
                                            color: Color.fromARGB(255, 242, 113, 33), fontSize: 22, fontWeight: FontWeight.bold):
                                        TextStyle(
                                          color: Colors.black.withOpacity(0.7),
                                          fontSize: 20,
                                        )
                                        ,
                                      ),
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            // Line
                            Container(
                              height: 1.5,
                              width: size.width * 0.2,
                              color: Colors.black.withOpacity(0.2),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Suggested accounts",
                              style: TextStyle(
                                color: Color.fromARGB(255, 103, 103, 103),
                                fontSize: 14,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            AccountItem(
                              avataUrl: "assets/images/cat.jpg",
                              name: "Cat",
                              tag: "Ms.Cat",),
                            SizedBox(
                              height: 15,
                            ),
                            AccountItem(
                              avataUrl: "assets/images/cat1.jpg",
                              name: "White Cat",
                              tag: "Ms.Cat",),
                            SizedBox(
                              height: 15,
                            ),
                            AccountItem(
                              avataUrl: "assets/images/cat2.jpg",
                              name: "Cat in love",
                              tag: "Ms.Cat",),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "See all",
                              style: TextStyle(
                                color: Color.fromARGB(255, 242, 113, 33),
                                fontSize: 14,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 1.5,
                              width: size.width * 0.2,
                              color: Colors.black.withOpacity(0.2),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Discover",
                              style: TextStyle(
                                color: Color.fromARGB(255, 103, 103, 103),
                                fontSize: 14,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                                children: [
                                  TagItem(
                                    tag: "Cat",
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  TagItem(
                                    tag: "Monster",
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  TagItem(
                                    tag: "Doja Cat",
                                  ),
                                ]
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Column(
                              children: [
                                MusicTagItem(
                                  name: "Yêu Đơn Phương Là Gì (MEE...",
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                MusicTagItem(
                                  name: "Về Nghe Mẹ Ru - NSND Bach...",
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                MusicTagItem(
                                  name: "Yêu Đơn Phương...",
                                ),
                              ],
                            )
                          ]
                      )
                  ),
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