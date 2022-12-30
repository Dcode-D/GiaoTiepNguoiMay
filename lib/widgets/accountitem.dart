import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:timeago/timeago.dart' as tago;

import '../pages/other_profile_page.dart';

class accountItem extends StatefulWidget{

  String imageurl;
  String username;
  String tag;
  bool logged;
  accountItem(this.imageurl,this.username,this.tag,this.logged);
  @override
  State<StatefulWidget> createState() => accountitemstate();

}

class accountitemstate extends State<accountItem>{

  bool isLogged = false;
  @override
  Widget build(BuildContext context) {
    return
    InkWell(
      onTap: (){
        setState(() {
          isLogged = ! isLogged;
        });
      },
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(
                      width: 1,
                      color: Colors.grey
                  )
              )),
          child:
          ListTile(
            leading:
            InkWell(
                onTap: (){
                  /*Navigator.push(context, PageRouteBuilder(
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
                  ));*/
                },
                child:
                CircleAvatar(
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage(widget.imageurl),
                )
            ),
            title: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child:
                    Text(
                      widget.username,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                Align(
                    alignment: Alignment.topLeft,
                    child:
                    ReadMoreText(
                      widget.tag,
                      trimLines: 4,
                      trimMode: TrimMode.Line,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      colorClickableText: Colors.pink,
                      moreStyle: const TextStyle(
                          fontSize: 17,
                          color: Colors.blue
                      ),
                      lessStyle:const TextStyle(
                          fontSize: 17,
                          color: Colors.blue
                      ) ,
                    )),
              ],
            ),

            trailing: InkWell(
              onTap: () {
              }
              ,
              child: isLogged? Icon(
                  Icons.check_circle,
                  size: 25,
                  color: Color.fromARGB(255, 242, 113, 33)
              ):
              Icon(
                  Icons.check_circle,
                  size: 25,
                  color: Colors.white
              )
              ,
            ),
          )
      ),
    );
  }
}