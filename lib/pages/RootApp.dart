import 'package:doangtnm/pages/FollowingAccountPage.dart';
import 'package:doangtnm/pages/CommentPage.dart';
import 'package:doangtnm/pages/DiscoveryPage.dart';
import 'package:doangtnm/pages/FollowerAccountsPage.dart';
import 'package:doangtnm/pages/ProfilePage.dart';
import 'package:doangtnm/widgets/followaccount.dart';
import 'package:doangtnm/widgets/header_home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doangtnm/pages/HomePage.dart';
import 'package:doangtnm/pages/LivePage.dart';
import 'package:doangtnm/theme/Colors.dart';
import 'package:doangtnm/widgets/upload_icon.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }
  Widget getBody(){
    return
    MaterialApp(
        builder: FlutterSmartDialog.init(),
        home:
      Stack( children:
          <Widget>[
      IndexedStack(
      index: pageIndex,
      children: <Widget>[
        HomePage(),
        DiscoveryPage(),
        Center(
          child: Text("Upload",style: TextStyle(
            color: black,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
        ),
        /*Center(
          child: Text("Live Video",style: TextStyle(
            color: black,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
        )*/
        LivePage(),
        ProfileScreen()
      ],
    ),
          ]
      )
    );
  }

  Widget getFooter() {
    List bottomItems = [
      {"icon":Icons.home_outlined, "label": "Home", "isIcon": true},
      {"icon":Icons.language_outlined, "label": "Discovery", "isIcon": true},
      {"icon": Icons.add_circle_rounded, "label": "", "isIcon": false},
      {"icon": Icons.live_tv_outlined, "label": "Live", "isIcon": true},
      {"icon": Icons.person_outline_rounded, "label": "Profile", "isIcon": true}
    ];
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(color: Color.fromARGB(255, 240 , 240, 240)),
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 10,top: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomItems.length,(index){
            return bottomItems[index]['isIcon'] ? 
            InkWell(
              onTap: (){
                selectTab(index);
              },
                          child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                   bottomItems[index]['icon'],
                    color:index==pageIndex? Color.fromARGB(255, 242, 113, 33):Colors.black ,
                    size: 40.0,
                  ),
                  Center(
                    child: Text(
                      bottomItems[index]['label'],
                      style: TextStyle(color:index==pageIndex? Color.fromARGB(255, 242, 113, 33):Colors.black ,fontSize: 10),
                    ),
                  )
                ],
              ),
            ) : 
            InkWell(
              onTap: (){
                selectTab(index);
              },
              child: UploadIcon()
              );
          }),
        ),
      ),
    );
  }
  selectTab(index){
    setState(() {
      pageIndex = index;
      if(pageIndex!=0){}
    });
  }
}


