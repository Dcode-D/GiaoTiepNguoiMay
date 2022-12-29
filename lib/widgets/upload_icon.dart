import 'package:flutter/material.dart';
import 'package:doangtnm/theme/colors.dart';
class UploadIcon extends StatelessWidget {
  const UploadIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Padding(padding: EdgeInsets.only(left: 0,top: 0,right: 0,bottom:0),
      child: Container(
        margin: EdgeInsets.only(left: 0,top: 0,right: 0,bottom:0),
      width: 50,
      height: 35,
      child: Icon(
       Icons.add_circle_rounded, color: Color.fromARGB(255, 242, 113, 33), size: 50),
    ));
  }
}