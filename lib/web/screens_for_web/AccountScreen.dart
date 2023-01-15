import 'package:doangtnm/web/widgets_for_web/AccountItem.dart';
import 'package:doangtnm/web/widgets_for_web/CustomAppBar.dart';
import 'package:doangtnm/web/widgets_for_web/MusicTagItem.dart';
import 'package:doangtnm/web/widgets_for_web/TagItem.dart';
import 'package:flutter/material.dart';

import '../../widgets/video_thumbnail.dart';

class AccountScreen extends StatefulWidget {
  @override
  const AccountScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AccountScreenState();
  }
}

class _AccountScreenState extends State<AccountScreen> with TickerProviderStateMixin {
  late TabController tabController;
  late ScrollController _scrollController;
  int tab = 0;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _scrollController = ScrollController();
  }
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
                  Container(
                    padding: EdgeInsets.only(left: 18, right: 18,top: 20),
                    height: size.height-80,
                    width: size.width * 0.8,
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            children:[
                              ClipOval(
                                child: Image.asset(
                                  "assets/images/cat2.jpg",
                                  width: 145 ,
                                  height: 145,
                                  fit: BoxFit.cover,
                                ),
                              ),
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
                                            "Black Cat",
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
                                          "@Mr.Cat",
                                          style: TextStyle(
                                              color: Colors.black.withOpacity(0.7),
                                              fontSize: 18,
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w500
                                          )
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    InkWell(
                                      onTap: () {

                                      },
                                      child: Container(
                                        width: 130,
                                        height: 33,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(5),
                                            border: Border.all(
                                              color:  Color.fromARGB(255, 242, 113, 33) ,
                                              width: 1,
                                            )
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Edit profile',
                                            style: TextStyle(
                                              color: Color.fromARGB(255, 242, 113, 33),
                                              fontSize: 16,
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]
                              )
                            ]
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                                "111",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w700
                                )
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                                "Following",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 16,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w400
                                )
                            ),
                            SizedBox(
                              width: 20,),
                            Text(
                                "111",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w700
                                )
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                                "Following",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 16,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w400
                                )
                            ),
                            SizedBox(
                              width: 20,),
                            Text(
                                "111",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w700
                                )
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                                "Following",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 16,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w400
                                )
                            ),
                            SizedBox(
                              width: 10,),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                            "Some description about the artist",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w400
                            )
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 50,
                          width: 400,
                          child: TabBar(
                              controller: tabController,
                              unselectedLabelColor: Colors.grey,
                              indicator: UnderlineTabIndicator(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 242, 113, 33), width: 3.0),
                                insets: EdgeInsets.fromLTRB(0, 0.0, 0, 0),
                              ),
                              labelColor: Color.fromARGB(255, 242, 113, 33),
                              tabs: [
                                Tab(
                                  icon: Icon(Icons.reorder),
                                ),
                                Tab(
                                    icon: Icon(Icons.lock_outline)
                                )
                              ]),
                        ),
                        Container(
                          height: 1.5,
                          width: size.width * 0.8,
                          color: Colors.black.withOpacity(0.1),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: size.height - 398,
                          width: size.width * 0.8,
                          color: Colors.transparent,
                          child: SafeArea(
                              child: NestedScrollView(
                                controller: _scrollController, headerSliverBuilder: (context, value) {
                                return <Widget>[];
                              }, body: TabBarView(
                                  physics: NeverScrollableScrollPhysics(),
                                  controller: tabController,
                                  children:[
                                    GridView.builder(
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
                                    GridView.builder(
                                      physics: BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: 3,
                                      gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 5,
                                        childAspectRatio: 1,
                                        crossAxisSpacing: 35,
                                        mainAxisSpacing: 20,
                                      ),
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            SizedBox(
                                                height:MediaQuery.of(context).size.height/4,
                                                width: MediaQuery.of(context).size.width/2.1,
                                                child: VideoThumbnail("assets/images/cat5.jpg", "1.3M")),
                                            SizedBox(height: 2,),
                                            Flexible(
                                                child: Text("How i met your mother and something came at us!",
                                              style: TextStyle(fontSize: 12,
                                                  color: Colors.black,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500),
                                              overflow: TextOverflow.ellipsis,)),
                                          ],
                                        );
                                      },
                                    )

                                  ]
                              ),

                              )
                          ),
                        )
                      ],
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