import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/OtherProfilePage.dart';

class followaccountitem extends StatelessWidget{

  String imgUrl;
  String userName;
  followaccountitem(this.imgUrl, this.userName);
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
              backgroundImage: AssetImage(imgUrl),
            )
        ),
        title:
                Text(
                  userName,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
        trailing:
          TextButton(onPressed: () {  }, child: Text("Remove",style: TextStyle(color: Colors.black),),
          style: TextButton.styleFrom(backgroundColor: Colors.grey),
          ),

      );
  }
}