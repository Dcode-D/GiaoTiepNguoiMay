import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:timeago/timeago.dart' as tago;

import '../pages/OtherProfilePage.dart';

class commentItem extends StatefulWidget{

  String imageurl;
  String username;
  String cmt;
  String datePub;
  String likes;
  commentItem(this.imageurl,this.username,this.cmt,this.datePub,this.likes);
  @override
  State<StatefulWidget> createState() => commnetitemstate();

}

class commnetitemstate extends State<commentItem>{

  bool isliked = false;
  @override
  Widget build(BuildContext context) {
    return
    Container(
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
        bottom: BorderSide(
          width: 1,
          color: Colors.transparent
        )
      )),
        child:
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
              widget.cmt,
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
        subtitle: Row(
          children: [
            Text(
              widget.datePub,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.likes.toString()+' likes',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: (){

              },
              child:Text(
                'Reply',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 102, 102, 102),
                ),
                )
              )
          ],
        ),
        trailing: InkWell(
          onTap: () {
            setState(() {
              isliked = ! isliked;
            });
            }
          ,
          child: isliked? Icon(
            Icons.favorite,
            size: 25,
            color: Colors.red
          ):
          Icon(
              Icons.favorite,
              size: 25,
              color: Colors.black
          )
          ,
        ),
      )
    );
  }
}