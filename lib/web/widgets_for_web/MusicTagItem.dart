import 'package:flutter/material.dart';
import 'package:doangtnm/theme/colors.dart';

class MusicTagItem extends StatefulWidget {
  final String? name;
  MusicTagItem({this.name});
  @override
  _MusicTagItemState createState() => _MusicTagItemState();
}

class _MusicTagItemState extends State<MusicTagItem>{
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

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
            Icon(Icons.not_started,color: Color.fromARGB(255, 74, 74, 74),),
            SizedBox(width: 5,),
            Text(widget.name!,style: TextStyle(
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