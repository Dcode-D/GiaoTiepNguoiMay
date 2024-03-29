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
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return
    Column(children:[
      TabBar(
          controller: _tabController,
          unselectedLabelColor: Colors.grey,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
                color: Color.fromARGB(255, 242, 113, 33), width: 5),
            insets: EdgeInsets.fromLTRB(28, 0.0, 28, 0),
          ),
          labelColor: Color.fromARGB(255, 242, 113, 33),
          tabs: [
            Tab(
              child: Text("Top",style: TextStyle(color: Colors.black,fontSize: 17),),
            ),
            Tab(
              child: Text("Videos",style: TextStyle(color: Colors.black, fontSize: 17)),
            ),
            Tab(
              child: Text("Profiles", style: TextStyle(color: Colors.black, fontSize: 17)),
            ),
      ]),
      SizedBox(height: 10,),
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
         Expanded(child:
         SingleChildScrollView(
           child:
           Column(
             children: [
               Container(
                 margin: EdgeInsets.only(bottom: 5),
                   child:
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 3),
                          child: Align(
                              child: Text("Profiles", style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17
                              ),),
                            alignment: Alignment.topLeft,

                          ),
                        ),
                        profiletile(),
                        profiletile(),
                      ],
                    )
               ),
               Container(
                 margin: EdgeInsets.only(left: 3),
                 child: Align(
                   child: Text("Videos", style: TextStyle(
                       fontWeight: FontWeight.w500,
                       fontSize: 17
                   ),),
                   alignment: Alignment.topLeft,

                 ),
               ),
               SizedBox(height: 5,),
               GridView.builder(
                 physics: NeverScrollableScrollPhysics(),
                 shrinkWrap: true,
                 itemCount: 10,
                 gridDelegate:
                 const SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 2,
                   childAspectRatio: 1,
                   crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                 ),
                 itemBuilder: (context, index) {
                   return
                     Column(
                         children:[
                           Flexible(
                             flex:12,
                             child: SizedBox(
                                 height:MediaQuery.of(context).size.height/4,
                                 width: MediaQuery.of(context).size.width/2.1,
                                 child:
                                 VideoThumbnail("assets/images/cat1.jpg", "1.5M")),
                           ),
                           SizedBox(height: 2,),
                           Flexible(
                             flex: 2,
                             child: Row(
                                 children:[
                                   Align(
                                       alignment:Alignment.centerLeft,
                                       child:
                                       SizedBox(
                                         width: 30,
                                         height:30,
                                         child:
                                         profileAvt("assets/images/cat5.jpg"),
                                       )
                                   ),
                                   Flexible(child:
                                   Text("How i met your mother and something came at us!", style: TextStyle(fontSize: 13,color: Colors.black, fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis,)),
                                 ]
                             ),
                           )
                         ]);
                 },
               ),
             ],
           ),
         )
     );
  }
}

class ProfilePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return
        ListView.builder(
            itemCount: 10,
            itemBuilder: (context,index)=>
            Container(

                child:
          ListTile(
            horizontalTitleGap: 20,
            leading:
              InkWell(
                  onTap: (){
                    Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => OtherProfileScreen(),
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
                radius: size.width/12,
                backgroundImage: Image.asset("assets/images/cat3.jpg").image,
              )
              ),
            title: InkWell(
                onTap: (){
                  Navigator.push(context, PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => OtherProfileScreen(),
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
                child: Text("User Cat",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),)),
            subtitle: Text("2.5M followers", style:  TextStyle(color: Colors.grey),),
            trailing: TextButton(child: Text("Follow",style: TextStyle(color: Colors.white,fontSize: 16),),
              style: TextButton.styleFrom(backgroundColor: Colors.orange),
            onPressed: (){},),
            )
            )
        );
  }
}

class profiletile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Function toprofile = (){
      Navigator.push(context, PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => OtherProfileScreen(),
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
    };
    return
      Container(
          child:
          ListTile(
            minLeadingWidth: 0,
            horizontalTitleGap: 10,
            leading:
            InkWell(
                onTap: (){
                  Navigator.push(context, PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => OtherProfileScreen(),
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
                  radius: size.width/12,
                  backgroundImage: Image.asset("assets/images/cat3.jpg").image,
                )
            ),
            title: InkWell(
                onTap: (){
                  toprofile();
                },
                child: Text("User Cat",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),)),
            subtitle: Text("2.5M followers", style:  TextStyle(color: Colors.grey),),
            trailing: TextButton(child: Text("Follow",style: TextStyle(color: Colors.white,fontSize: 16),),
              style: TextButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: (){},),
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
            itemCount: 10,
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: 2,
            ),
            itemBuilder: (context, index) {
              return
                Column(
                    children:[
                      Flexible(
                        flex:12,
                        child: SizedBox(
                            height:MediaQuery.of(context).size.height/5,
                            width: MediaQuery.of(context).size.width/2.1,
                            child:
                            VideoThumbnail("assets/images/cat5.jpg", "1.5M")),
                      ),
                      Flexible(
                        flex: 2,
                        child: Row(
                            children:[
                              Align(
                                  alignment:Alignment.centerLeft,
                                  child:
                                  SizedBox(
                                    width: 30,
                                    height:30,
                                    child:
                                    profileAvt("assets/images/cat5.jpg"),
                                  )
                              ),
                              Flexible(child:
                              Text("How i met your mother and something came at us!", style: TextStyle(fontSize: 13,color: Colors.black, fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis,)),
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
              pageBuilder: (context, animation, secondaryAnimation) => OtherProfileScreen(),
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