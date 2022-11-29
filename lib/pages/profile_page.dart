import 'package:cached_network_image/cached_network_image.dart';
import 'package:doangtnm/pages/FollowingAccountPage.dart';
import 'package:doangtnm/pages/followeraccountsPage.dart';
import 'package:doangtnm/widgets/tik_tok_icons.dart';
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
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.person_add_alt_1_outlined,
          color: Colors.black,
        ),
        actions: const [

          Icon(Icons.more_horiz,
            color: Colors.black,),
          SizedBox(width: 5)
        ],
        title: Text(
          "User Name",
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
                ClipOval(
                    child: Image.asset("assets/images/cat.jpg",height: 100,width: 100,fit: BoxFit.fill,)
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "@User",
              style: const TextStyle(
                fontSize: 17,
              ),
            ),
            const SizedBox(
              height: 15,
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
                      ),
                    ),
                  ],
                )
                ),
                Container(
                  color: Colors.black54,
                  width: 1,
                  height: 15,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
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
                      ),
                    ),
                  ],
                )
                ),
                Container(
                  color: Colors.black54,
                  width: 1,
                  height: 15,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
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
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 140,
              height: 47,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                ),
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
                    "follow/unfollow",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TabBar(
                controller: tabController,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.black38,
                labelColor: Colors.black,
                tabs: [
                  Icon(Icons.video_collection),
                  Icon(TikTokIcons.heart)
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
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          crossAxisSpacing: 2,
                        ),
                        itemBuilder: (context, index) {
                          return Image.asset("assets/images/cat.jpg",fit: BoxFit.cover,);
                        },
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          crossAxisSpacing: 2,
                        ),
                        itemBuilder: (context, index) {
                          return Image.asset("assets/images/cat.jpg",fit: BoxFit.cover,);
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