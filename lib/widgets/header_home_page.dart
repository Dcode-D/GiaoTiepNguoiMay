import 'package:flutter/material.dart';
import 'package:doangtnm/theme/colors.dart';

class HeaderHomePage extends StatefulWidget {
  const HeaderHomePage({
     Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return headerstate();
  }
}

class headerstate extends State<HeaderHomePage>{
  int tab=1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: (){setState(() {
            tab=0;
          });},
            child:
        Text(
          "For You",
          style:(tab==0)? TextStyle(
              color: Color.fromARGB(255, 242, 113, 33), fontSize: 20, fontWeight: FontWeight.w500):
          TextStyle(
            color: white.withOpacity(0.7),
            fontSize: 20,
          )
          ,
        )),
        SizedBox(
          width: 16,
        ),
        InkWell(
            onTap: (){
              setState(() {
                tab=1;
              });
            },
            child:
        Text(
          "Following",
          style: (tab==1)? TextStyle(
              color: Color.fromARGB(255, 242, 113, 33), fontSize: 20, fontWeight: FontWeight.w500):
          TextStyle(
            color: white.withOpacity(0.7),
            fontSize: 20,
          ),
        )),
            /*InkWell(
                onTap: (){
                  setState(() {

                  });
                },
                child:
                Icon(Icons.search ,color: white.withOpacity(0.7),size: 30,)
            )*/
      ],
    );
  }
}