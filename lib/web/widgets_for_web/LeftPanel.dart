import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../theme/Colors.dart';
import 'AccountItem.dart';
import 'MusicTagItem.dart';
import 'TagItem.dart';

class LeftPanel extends StatefulWidget {
  const LeftPanel({
    Key? key,
  }) : super(key: key);

  @override
  State<LeftPanel> createState() => _LeftPanelState();
}

class _LeftPanelState extends State<LeftPanel> with TickerProviderStateMixin{
  int tab = 0;
  @override
  Widget build(BuildContext context) {
    GlobalKey currentKey = GlobalKey();
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
            padding: EdgeInsets.only(left: 50, right: 50, top: 30),
            height: size.height-86.5,
            width: size.width * 0.2,
            color: Colors.transparent,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                      onTap: (){
                        setState(() {
                          tab=0;
                        });},
                      child:
                      Row(
                        children: [
                          Icon(
                              Icons.home_outlined,
                              color: (tab==0)? Color.fromARGB(255, 242, 113, 33) : Colors.black.withOpacity(0.7),
                              size: (tab==0)? 37: 35
                          ),
                          SizedBox(width: 17,),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              "For You",
                              style:(tab==0)? TextStyle(
                                  color: Color.fromARGB(255, 242, 113, 33), fontSize: 22, fontWeight: FontWeight.bold):
                              TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 20,
                              )
                              ,
                            ),
                          ),
                        ],
                      )
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                      onTap: (){
                        setState(() {
                          tab=1;
                        });},
                      child:
                      Row(
                        children: [
                          Icon(
                              Icons.people_outline,
                              color: (tab==1)? Color.fromARGB(255, 242, 113, 33) : Colors.black.withOpacity(0.7),
                              size: (tab==1)? 37: 35
                          ),
                          SizedBox(width: 17,),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              "Following",
                              style:(tab==1)? TextStyle(
                                  color: Color.fromARGB(255, 242, 113, 33),
                                  fontSize: 22, fontWeight: FontWeight.bold):
                              TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 20,
                              )
                              ,
                            ),
                          ),
                        ],
                      )
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                      onTap: (){
                        setState(() {
                          tab=2;
                        });},
                      child:
                      Row(
                        children: [
                          Icon(
                              Icons.cast_outlined,
                              color: (tab==2)? Color.fromARGB(255, 242, 113, 33) : Colors.black.withOpacity(0.7),
                              size: (tab==2)? 37: 35
                          ),
                          SizedBox(width: 17,),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              "Live",
                              style:(tab==2)? TextStyle(
                                  color: Color.fromARGB(255, 242, 113, 33), fontSize: 22, fontWeight: FontWeight.bold):
                              TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 20,
                              )
                              ,
                            ),
                          ),
                        ],
                      )
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // Line
                  Container(
                    height: 1.5,
                    width: size.width * 0.2,
                    color: Colors.black.withOpacity(0.2),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Suggested accounts",
                    style: TextStyle(
                      color: Color.fromARGB(255, 103, 103, 103),
                      fontSize: 14,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  AccountItem(
                    avataUrl: "assets/images/cat.jpg",
                    name: "Cat",
                    tag: "Ms.Cat",),
                  SizedBox(
                    height: 15,
                  ),
                  AccountItem(
                    avataUrl: "assets/images/cat1.jpg",
                    name: "White Cat",
                    tag: "Ms.Cat",),
                  SizedBox(
                    height: 15,
                  ),
                  AccountItem(
                    avataUrl: "assets/images/cat2.jpg",
                    name: "Cat in love",
                    tag: "Ms.Cat",),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      color: Color.fromARGB(255, 242, 113, 33),
                      fontSize: 14,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1.5,
                    width: size.width * 0.2,
                    color: Colors.black.withOpacity(0.2),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Discover",
                    style: TextStyle(
                      color: Color.fromARGB(255, 103, 103, 103),
                      fontSize: 14,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                      children: [
                        TagItem(
                          tag: "Cat",
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TagItem(
                          tag: "Monster",
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TagItem(
                          tag: "Doja Cat",
                        ),
                      ]
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Column(
                    children: [
                      MusicTagItem(
                        name: "Yêu Đơn Phương Là Gì (MEE...",
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      MusicTagItem(
                        name: "Về Nghe Mẹ Ru - NSND Bach...",
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      MusicTagItem(
                        name: "Yêu Đơn Phương...",
                      ),
                    ],
                  )
                ]
            )
        ),
      ],
    );
  }
}
