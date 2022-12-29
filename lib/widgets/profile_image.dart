import 'package:doangtnm/pages/other_profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';

class ProfileImage extends StatefulWidget{
  String imgurl;
  ProfileImage({required this.imgurl});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProfileImgState();
  }
}

class ProfileImgState extends State<ProfileImage>{

  bool toggled = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 60,
      child: Stack(
        children: <Widget>[
          InkWell(
              onTap: (){
                Navigator.of(context, rootNavigator: true).push(PageRouteBuilder(
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
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(color: white),
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        widget.imgurl),
                    fit: BoxFit.cover)),
          )
          ),
          Positioned(
              bottom: 3,
              left: 18,
              child:
              InkWell(
              onTap: (){setState(() {
    toggled=!toggled;
    });},
    child:
              AnimatedSwitcher(
                  duration: Duration(milliseconds: 500),
                      transitionBuilder: (Widget child, Animation<double> animation) {
                      return ScaleTransition(scale: animation, child: child);},
              child:
    (!toggled)?
              Container(
                width: 20,
                height: 20,
                decoration:
                BoxDecoration(shape: BoxShape.circle, color: primary),
                child: Center(
                    child: Icon(
                      Icons.add,
                      color: white,
                      size: 15,
                    )),
              ):
              Container(
                width: 20,
                height: 20,
                decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Center(
                    child: Icon(
                      Icons.check,
                      color: Colors.red,
                      size: 15,
                    )),
              )
              )
          )
          )
        ],
      ),
    );
  }
}