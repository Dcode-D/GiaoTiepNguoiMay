import 'package:cached_network_image/cached_network_image.dart';
import 'package:doangtnm/pages/FollowingAccountPage.dart';
import 'package:doangtnm/pages/followeraccountsPage.dart';
import 'package:doangtnm/widgets/tik_tok_icons.dart';
import 'package:doangtnm/widgets/video_thumbnail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin{

  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: const [
          Icon(Icons.more_horiz,
            color: Colors.black),
          SizedBox(width: 5)
        ],
        title: Text(
          "Mr.CatInLove",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child:
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(left: 0,top: 20,right: 0,bottom: 0),
                child: ClipOval(
                    child: Image.asset("assets/images/cat.jpg",height: 100,width: 101,fit: BoxFit.fill,)
                ))
              ],
            ),
            Padding(
                padding: EdgeInsets.only(left: 0,top: 10,right: 0,bottom:0),
                child: Text(
                  "@Mr.CatInLove",
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
                    onTap: (){
                      Navigator.push(context, PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => followingList(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0);
                          const end = Offset.zero;
                          const curve = Curves.ease;

                          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

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
                    onTap: (){
                      Navigator.push(context, PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => followerList(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0);
                          const end = Offset.zero;
                          const curve = Curves.ease;

                          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

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
            Container(
              width: 130,
              height: 33,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(255, 242, 113, 33),
                ),
                borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              child: Center(
                child: InkWell(
                  onTap: () {
                    // if (widget.uid == authController.user.uid) {
                    //   authController.signOut();
                    // } else {
                    //   controller.followUser();
                    // }
                  },
                  child: Text(
                    "Edit profile",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 242, 113, 33)
                    ),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 0,top: 12,right: 0,bottom:5),
              child: Center(
                  child:Text (
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
                  borderSide: BorderSide(color: Color.fromARGB(255, 242, 113, 33), width: 5.0),
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
            // video list
            Expanded(
                child:
                TabBarView(
                    controller: tabController,
                    children:[
                      GridView.builder(
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
                )
            )
          ],
        ),
      ),
    );
  }
}