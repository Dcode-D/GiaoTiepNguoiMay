import 'package:cached_network_image/cached_network_image.dart';
import 'package:doangtnm/widgets/tik_tok_icons.dart';
import 'package:doangtnm/widgets/video_thumbnail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FollowingAccountPage.dart';
import 'FollowerAccountsPage.dart';

class OtherProfileScreen extends StatefulWidget {
  const OtherProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OtherProfileScreen> createState() => _OtherProfileScreenState();
}

class _OtherProfileScreenState extends State<OtherProfileScreen> with TickerProviderStateMixin{

  late TabController tabController;
  late ScrollController _scrollController;
  bool isFollowing = false;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading:
        InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child:
        Icon(
          Icons.arrow_back,
          color: Colors.black,
        )),
        actions: const [
          Icon(Icons.more_horiz,
            color: Colors.black,),
          SizedBox(width: 5)
        ],
        title: Text(
          "Mrs.WhiteCat",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
          child:
          NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder:
                (context,value) {
              return <Widget>[
                SliverToBoxAdapter(
                    child:
                    Column(
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(padding: EdgeInsets.only(
                                left: 0, top: 20, right: 0, bottom: 0),
                                child: ClipOval(
                                    child: Image.asset("assets/images/cat.jpg", height: 100,
                                      width: 101,
                                      fit: BoxFit.fill,)
                                ))
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 0, top: 10, right: 0, bottom: 0),
                          child: Text(
                            "@Mrs.WhiteCat",
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.push(context, PageRouteBuilder(
                                    pageBuilder: (context, animation, secondaryAnimation) =>
                                        followingList(),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      const begin = Offset(1.0, 0.0);
                                      const end = Offset.zero;
                                      const curve = Curves.ease;

                                      var tween = Tween(begin: begin, end: end).chain(
                                          CurveTween(curve: curve));

                                      return SlideTransition(
                                        position: animation.drive(tween),
                                        child: child,
                                      );
                                    },
                                  ));
                                },
                                child:
                                Column(
                                  children: [
                                    Text(
                                      "100",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      'Following',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color.fromARGB(255, 120, 120, 120)
                                      ),
                                    ),
                                  ],
                                )
                            ),
                            Container(
                              width: 1,
                              height: 15,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.push(context, PageRouteBuilder(
                                    pageBuilder: (context, animation, secondaryAnimation) =>
                                        followerList(),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      const begin = Offset(1.0, 0.0);
                                      const end = Offset.zero;
                                      const curve = Curves.ease;

                                      var tween = Tween(begin: begin, end: end).chain(
                                          CurveTween(curve: curve));

                                      return SlideTransition(
                                        position: animation.drive(tween),
                                        child: child,
                                      );
                                    },
                                  ));
                                },
                                child:
                                Column(
                                  children: [
                                    Text(
                                      '250',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      'Followers',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color.fromARGB(255, 120, 120, 120)
                                      ),
                                    ),
                                  ],
                                )
                            ),
                            Container(
                              width: 1,
                              height: 15,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  '300',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  'Likes',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromARGB(255, 120, 120, 120)
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isFollowing = !isFollowing;
                            });
                          },
                          child: Container(
                            width: 130,
                            height: 33,
                            decoration: BoxDecoration(
                              color: isFollowing ? Color.fromARGB(255, 242, 113, 33) : Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color:  Color.fromARGB(255, 242, 113, 33) ,
                                width: 1,
                              )
                            ),
                            child: Center(
                              child: Text(
                                isFollowing ? 'Follow' : 'Following',
                                style: TextStyle(
                                  color: isFollowing ? Colors.white : Color.fromARGB(255, 242, 113, 33),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 0, top: 12, right: 0, bottom: 5),
                            child: Center(
                                child: Text(
                                  "Some description",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black
                                  ),
                                )
                            )
                        ),
                        TabBar(
                            controller: tabController,
                            unselectedLabelColor: Colors.grey,
                            indicator: UnderlineTabIndicator(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 242, 113, 33), width: 5.0),
                              insets: EdgeInsets.fromLTRB(65, 0.0, 65, 0),
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
                        const SizedBox(
                          height: 3,
                        ),
                      ],
                    )
                )
              ];
            },
            body: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: tabController,
                children:[
                  GridView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),

                    itemBuilder: (context, index) {
                      return VideoThumbnail("assets/images/cat1.jpg", "1.5M");
                    },
                  ),
                  GridView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),
                    itemBuilder: (context, index) {
                      return VideoThumbnail("assets/images/cat5.jpg", "1.3M");
                    },
                  )
                ]
            ),
          )
      ),
      );
  }
}