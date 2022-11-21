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

class LikeState extends State<LikeComponent>{
  bool isliked = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: (){setState(() {
        isliked = !isliked;
      });},
      child: Container(
        child: Column(
          children: [
            Icon(TikTokIcons.heart,
              color: (isliked)?Colors.red:Colors.white,
              size: 35.0,
            ),
            SizedBox(height: 5),
            Text(
              widget.likes.toString(),
              style: TextStyle(
                  color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }

}