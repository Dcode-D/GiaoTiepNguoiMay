import 'package:doangtnm/web/screens_for_web/TagNameScreen.dart';
import 'package:flutter/material.dart';
import 'package:doangtnm/theme/colors.dart';

class TagItem extends StatefulWidget {
  final String? tag;
  TagItem({this.tag});
  @override
  _TagItemState createState() => _TagItemState();
}

class _TagItemState extends State<TagItem>{
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => TagNameScreen()));
      },
      child: Container(
        padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Color.fromARGB(255, 161, 161, 161),width: 1.5)
        ),
        child: Row(
          children: [
            Text("#",style: TextStyle(
              color: Color.fromARGB(255, 12, 12, 12),
              fontSize: 14,
              fontFamily: "Popins",
              fontWeight: FontWeight.w500
            ),),
            Text(widget.tag!,style: TextStyle(
              color: Color.fromARGB(255, 74, 74, 74),
              fontSize: 14,
              fontFamily: "Popins",
              fontWeight: FontWeight.w500
            ),),
          ],
        ),
      ),
    );
  }
}