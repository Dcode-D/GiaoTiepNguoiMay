import 'package:doangtnm/widgets/tik_tok_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LikeComponent extends StatefulWidget{
  String likes;
  LikeComponent({required this.likes});
  @override
  State<StatefulWidget> createState() {
    return LikeState();
  }
}

class LikeState extends State<LikeComponent> with SingleTickerProviderStateMixin {
  bool isliked = false;
  bool ischanging = false;
  late AnimationController animationController;
  late Animation animation;
  
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(microseconds: 30000));
    animation = CurvedAnimation(parent: animationController, curve: Curves.easeIn);
    animation.addListener(() {setState(() {
    });});

    animation.addStatusListener((status) {if(status==AnimationStatus.completed){
      animationController.reset();
      setState(() {
        ischanging = false;
      });
    }});
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      InkWell(
      onTap: (){setState(() {
        isliked = !isliked;
        ischanging = !ischanging;
      });
      animationController.forward();
        },
      child:(ischanging)?
      Transform.scale(
          scale: animation.value,
          child:
      Container(
        child: Row(
          children: [
            Icon(Icons.favorite_border,
              color: (isliked)?Color.fromARGB(255, 242, 113, 33):Colors.black,
              size: 30.0,
            ),
            SizedBox(height: 5),
            Text(
              widget.likes.toString(),
              style: TextStyle(
                  color: Colors.black, fontSize: 12,fontFamily: 'Inter', fontWeight: FontWeight.w500),
            )
          ],
        ),
      )):
      Transform.scale(
          scale: 1,
          child:
          Container(
            child: Column(
              children: [
                Icon(Icons.favorite,
                  color: (isliked)?Colors.red:Colors.black,
                  size: 30.0,
                ),
                SizedBox(height: 5),
                Text(
                  widget.likes.toString(),
                  style: TextStyle(
                      color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700),
                )
              ],
            ),
          ))
        ,
    );
  }
}