import 'package:doangtnm/web/widgets_for_web/AccountItem.dart';
import 'package:doangtnm/web/widgets_for_web/CustomAppBar.dart';
import 'package:doangtnm/web/widgets_for_web/LeftPanel.dart';
import 'package:doangtnm/web/widgets_for_web/MusicTagItem.dart';
import 'package:doangtnm/web/widgets_for_web/TagItem.dart';
import 'package:flutter/material.dart';

import '../../widgets/video_thumbnail.dart';

class ProfileScreen extends StatefulWidget {
  @override
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin {
  late TabController tabController;
  late ScrollController _scrollController;
  int tab = 0;
  bool isFollow = false;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _scrollController = ScrollController();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                  LeftPanel(),
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
                                "assets/images/cat.jpg",
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
                                      "Cat In Love",
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
                                    "@Ms.Cat",
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
                                    setState(() {
                                      isFollow = !isFollow;
                                    });
                                  },
                                  child: Container(
                                    width: 130,
                                    height: 33,
                                    decoration: BoxDecoration(
                                        color: isFollow ? Color.fromARGB(255, 242, 113, 33) : Colors.transparent,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color:  Color.fromARGB(255, 242, 113, 33) ,
                                          width: 1,
                                        )
                                    ),
                                    child: Center(
                                      child: Text(
                                        isFollow ? 'Follow' : 'Following',
                                        style: TextStyle(
                                          color: isFollow ? Colors.white : Color.fromARGB(255, 242, 113, 33),
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
                                            Flexible(
                                              flex:3,
                                              child: SizedBox(
                                                height:MediaQuery.of(context).size.height/4,
                                                width: MediaQuery.of(context).size.width/2.1,
                                                child: VideoThumbnail("assets/images/cat1.jpg", "1.5M")),
                                            ),
                                            SizedBox(height: 2,),
                                            Flexible(
                                                flex:1,
                                                child:
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
                                              child: Text(
                                            "How i met your mother and something came at us!",
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
      ),
    );
  }
}