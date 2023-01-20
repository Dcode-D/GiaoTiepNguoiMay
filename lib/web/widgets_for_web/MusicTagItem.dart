import 'package:flutter/material.dart';
import 'package:doangtnm/theme/colors.dart';

import '../screens_for_web/TagNameScreen.dart';

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
              Flexible(
                flex: 0,
                fit: FlexFit.loose,
                  child: Icon(Icons.not_started,color: Color.fromARGB(255, 74, 74, 74),)),
              Flexible(
                  fit: FlexFit.loose,
                  child: SizedBox(width: 5,)),
              Flexible(
                flex: 5,
                fit: FlexFit.tight,
                child: Text(widget.name!,style: TextStyle(
                    color: Color.fromARGB(255, 74, 74, 74),
                    fontSize: 14,
                    fontFamily: "Popins",
                    fontWeight: FontWeight.w500
                ),),
              ),
            ],
          ),
        ),
    );
  }
}