import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/OtherProfilePage.dart';

class FollowingAccountItem extends StatefulWidget{
  String userName;
  String imgUrl;
  FollowingAccountItem(this.imgUrl,this.userName);
  @override
  State<StatefulWidget> createState() => FollowingAccountState();
}

class FollowingAccountState extends State<FollowingAccountItem>{
  bool isfollowing = true;
  @override
  Widget build(BuildContext context) {
    return
      ListTile(
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
              backgroundColor: Colors.black,
              backgroundImage: AssetImage(widget.imgUrl),
            )
        ),
        title:
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
          child: Text(
            widget.userName,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        trailing:
        TextButton(onPressed: () {setState(() {
          isfollowing = !isfollowing;
        });  },
          child:isfollowing?
          Text("Unfollow",style: TextStyle(color: Colors.black),)
            :
        Text("Follow",style: TextStyle(color: Colors.white),),
          style: TextButton.styleFrom(backgroundColor:isfollowing? Colors.grey:Colors.orange)
          ,
        ),
      );
  }
}