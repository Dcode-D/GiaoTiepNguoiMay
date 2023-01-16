import 'package:doangtnm/web/widgets_for_web/AccountItem.dart';
import 'package:doangtnm/web/widgets_for_web/CustomAppBar.dart';
import 'package:doangtnm/web/widgets_for_web/LeftPanel.dart';
import 'package:doangtnm/web/widgets_for_web/MusicTagItem.dart';
import 'package:doangtnm/web/widgets_for_web/TagItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class HomeScreen extends StatefulWidget {
  @override
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      builder: FlutterSmartDialog.init(),
      home: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: <Widget>[
              CustomAppBar(),
              LeftPanel()
            ],
          )
        ),
      ),
    );
  }
}