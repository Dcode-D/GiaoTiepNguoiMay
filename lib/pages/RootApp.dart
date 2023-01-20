import 'package:doangtnm/pages/FollowingAccountPage.dart';
import 'package:doangtnm/pages/CommentPage.dart';
import 'package:doangtnm/pages/DiscoveryPage.dart';
import 'package:doangtnm/pages/FollowerAccountsPage.dart';
import 'package:doangtnm/pages/ProfilePage.dart';
import 'package:doangtnm/pages/SearchResultPage.dart';
import 'package:doangtnm/web/screens_for_web/VideoResultScreen.dart';
import 'package:doangtnm/web/screens_for_web/VideosPage.dart';
import 'package:doangtnm/web/screens_for_web/AccountScreen.dart';
import 'package:doangtnm/web/widgets_for_web/LoginDialog.dart';
import 'package:doangtnm/web/widgets_for_web/VideoRightPanelComments.dart';
import 'package:doangtnm/web/screens_for_web/HomeScreen.dart';
import 'package:doangtnm/web/screens_for_web/ProfileScreen.dart';
import 'package:doangtnm/web/screens_for_web/TagNameScreen.dart';
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
  static bool isLogged = false;
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      body: getBody()
    );
  }
  Widget getBody() {
    return
      MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: FlutterSmartDialog.init(),
        theme: ThemeData(
          primaryColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      );
  }
}


