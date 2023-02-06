import 'package:doangtnm/web/screens_for_web/AccountScreen.dart';
import 'package:doangtnm/web/screens_for_web/ProfileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../widgets/profile_image.dart';
import '../widgets/video_thumbnail.dart';
import 'OtherProfilePage.dart';

class SearchResultPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState()=> SearchState();
}

class SearchState extends State<SearchResultPage> with TickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }
  void _handleTabSelection() {
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children:[
        Container(
      height: 50,
      width: 400,
        child: TabBar(
            controller: _tabController,
            unselectedLabelColor: Colors.grey,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 242, 113, 33), width: 3),
              insets: EdgeInsets.fromLTRB(28, 0.0, 28, 0),
            ),
            labelColor: Color.fromARGB(255, 242, 113, 33),
            tabs: [
              Tab(
                child: Text("Top",style: TextStyle(
                    color: _tabController.index == 0 ? Color.fromARGB(255, 242, 113, 33) : Colors.grey,
                    fontSize: 17,
                    fontFamily: 'Poppins'),),
              ),
              Tab(
                child: Text("Videos",style: TextStyle(
                    color: _tabController.index == 1 ? Color.fromARGB(255, 242, 113, 33) : Colors.grey,
                    fontSize: 17,
                    fontFamily: 'Poppins')),
              ),
              Tab(
                child: Text("Profiles", style: TextStyle(
                    color: _tabController.index == 2 ? Color.fromARGB(255, 242, 113, 33) : Colors.grey,
                    fontSize: 17,
                    fontFamily: 'Poppins')),
              ),
        ]),
      ),
      SizedBox(height: 20,),
      Expanded(
          child:
      TabBarView(
          controller: _tabController,
          children: [
            TopPage(),
            videoPage(),
            ProfilePage(),
      ])
      )
    ]
    );
  }
}

class TopPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return
     Row(
       children: [
         Expanded(child:
         GridView.builder(
           shrinkWrap: true,
           itemCount: 15,
           gridDelegate:
           const SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 3,
             childAspectRatio: 1,
             crossAxisSpacing: 10,
              mainAxisSpacing: 15,
           ),
           itemBuilder: (context, index) {
             return
               Column(
                   children:[
                     Flexible(
                       flex:7,
                       child: SizedBox(
                           height:MediaQuery.of(context).size.height/1.5,
                           width: MediaQuery.of(context).size.width/1.9,
                           child:
                           VideoThumbnail("assets/images/cat4.jpg", "1.5M")),
                     ),
                     Flexible(
                       flex: 1,
                       child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                           children:[
                             Flexible(
                               flex:1,
                               child: Align(
                                   alignment:Alignment.centerLeft,
                                   child:
                                   SizedBox(
                                     width: 50,
                                     height: 50,
                                     child:
                                     profileAvt("assets/images/cat5.jpg"),
                                   )
                               ),
                             ),
                             Flexible(
                                 flex:8,
                                 child:
                             Text("How i met your mother and something came at us!", style: TextStyle(fontSize: 18,color: Colors.black, fontFamily: 'Inter', fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,)),
                           ]
                       ),
                     )
                   ]);
           },
         )
         )
       ],
     );
  }
}
class ProfilePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _stateProfilePage();
}

class _stateProfilePage extends State<ProfilePage>{
  bool isFollowed = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return
        ListView.builder(
            itemCount: 30,
            itemBuilder: (context,index)=>
            Container(
                decoration: BoxDecoration(border:
                  Border(
                        bottom: BorderSide(width: 0.5,color: Colors.black.withOpacity(0.2))
                  )
                ),
                child:
          ListTile(
            horizontalTitleGap: 20,
            leading:
              SizedBox(
                  height: size.height/4,
                  width: size.width/30,
                  child:
                      InkWell(
                          onTap: (){
                            Navigator.push(context, PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => ProfileScreen(),
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
              CircleAvatar(
                backgroundImage: Image.asset("assets/images/cat3.jpg").image,
              )
              )
              ),
            title: Text("User Cat",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
            subtitle: Text("2.5M followers", style:  TextStyle(color: Colors.grey),),
            trailing: TextButton(child: Text(isFollowed? "Following" : "Follow",style: TextStyle(color:Colors.white,fontSize: 16),),
              style: TextButton.styleFrom(backgroundColor: Colors.orange),
            onPressed: (){
              setState(() {
                isFollowed = !isFollowed;
              });
            },),
            )
            )
        );
  }
}

class videoPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
      Row(
        children: [
          Expanded(child:
          GridView.builder(
            shrinkWrap: true,
            itemCount: 15,
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 15,
            ),
            itemBuilder: (context, index) {
              return
                Column(
                    children:[
                      Flexible(
                        flex: 7,
                        child: SizedBox(
                           height:MediaQuery.of(context).size.height/1.5,
                           width: MediaQuery.of(context).size.width/1.9,
                            child:
                            VideoThumbnail("assets/images/cat6.jpg", "1.5M")),
                      ),
                      SizedBox(height: 2,),
                      Flexible(
                        flex: 1,
                        child: Row(
                            children:[
                              Flexible(
                                flex:1,
                                child: Align(
                                    alignment:Alignment.centerLeft,
                                    child:
                                    SizedBox(
                                      width: 50,
                                      height:50,
                                      child:
                                      profileAvt("assets/images/cat5.jpg"),
                                    )
                                ),
                              ),
                              Flexible(
                                flex: 8,
                                  child:
                              Text("How i met your mother and something came at us!", style: TextStyle(fontSize: 18,color: Colors.black, fontFamily: 'Inter', fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,)),
                            ]
                        ),
                      )
                    ]);
            },
          )
          )
        ],
      );
  }
}

class profileAvt extends StatelessWidget{
  String imgUrl;
  profileAvt(this.imgUrl);
  @override
  Widget build(BuildContext context) {
    return
      InkWell(
          onTap: (){
            Navigator.push(context, PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => ProfileScreen(),
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
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: Image.asset(imgUrl).image,
                    fit: BoxFit.cover)),
          )
      );
  }
}