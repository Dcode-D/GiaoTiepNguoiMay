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
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
            padding: EdgeInsets.only(left: 50, right: 50, top: 30),
            height: size.height,
            width: size.width * 0.2,
            color: Colors.transparent,
            child: SingleChildScrollView(
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
                            Flexible(
                              flex: 2,
                              child: Icon(
                                  Icons.home_outlined,
                                  color: (tab==0)? Color.fromARGB(255, 242, 113, 33) : Colors.black.withOpacity(0.7),
                                  size: (tab==0)? 37: 35
                              ),
                            ),
                            Flexible(
                              flex: 1,
                                child: SizedBox(width: 17,)),
                            Flexible(
                              flex: 3,
                              child: Padding(
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
                            Flexible(
                              flex: 2,
                              child: Icon(
                                  Icons.people_outline,
                                  color: (tab==1)? Color.fromARGB(255, 242, 113, 33) : Colors.black.withOpacity(0.7),
                                  size: (tab==1)? 37: 35
                              ),
                            ),
                            Flexible(
                                flex: 1,
                                child: SizedBox(width: 17,)),
                            Flexible(
                              flex: 3,
                              child: Padding(
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
                            Flexible(
                              flex: 2,
                              child: Icon(
                                  Icons.cast_outlined,
                                  color: (tab==2)? Color.fromARGB(255, 242, 113, 33) : Colors.black.withOpacity(0.7),
                                  size: (tab==2)? 37: 35
                              ),
                            ),
                            Flexible(
                                flex: 1,
                                child: SizedBox(width: 17,)),
                            Flexible(
                              flex: 3,
                              child: Padding(
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
                    //TODO: cần chỉnh lại flex account item
                    SingleChildScrollView(
                      child: Container(
                        height: 200,
                        width: size.width * 0.2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 2,
                              child: SizedBox(
                              height: 5,
                              ),
                            ),
                            Flexible(
                              flex: 6,
                              fit: FlexFit.loose,
                              child: AccountItem(
                                avataUrl: "assets/images/cat.jpg",
                                name: "Cat",
                                tag: "Ms.Cat",),
                            ),
                            Flexible(
                              flex: 2,
                              child: SizedBox(
                                height: 15,
                              ),
                            ),
                            Flexible(
                              flex: 6,
                              fit: FlexFit.loose,
                              child: AccountItem(
                                avataUrl: "assets/images/cat1.jpg",
                                name: "White Cat",
                                tag: "Ms.Cat",),
                            ),
                            Flexible(
                              flex: 2,
                              child: SizedBox(
                                height: 15,
                              ),
                            ),
                            Flexible(
                              flex: 6,
                              fit: FlexFit.loose,
                              child: AccountItem(
                                avataUrl: "assets/images/cat2.jpg",
                                name: "Cat in love",
                                tag: "Ms.Cat",),
                            ),
                            Flexible(
                              flex: 3,
                              child: SizedBox(
                                height: 15,
                              ),
                            ),
                            Flexible(
                              flex: 4,
                              fit: FlexFit.tight,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15, top:10),
                                child: Text(
                                  "See all",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 242, 113, 33),
                                    fontSize: 14,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      height: 1.5,
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
                    Container(
                      height: 30,
                      width: size.width * 0.2,
                      child: Row(
                          children: [
                            Flexible(
                              flex: 0,
                              fit: FlexFit.loose,
                              child: TagItem(
                                tag: "Cat",
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: SizedBox(
                                width: 10,
                              ),
                            ),
                            Flexible(
                              flex: 0,
                              fit: FlexFit.loose,
                              child: TagItem(
                                tag: "Monster",
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: SizedBox(
                                width: 10,
                              ),
                            ),
                            Flexible(
                              flex: 0,
                              fit: FlexFit.loose,
                              child: TagItem(
                                tag: "Doja Cat",
                              ),
                            ),
                          ]
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 150,
                      width: size.width * 0.2,
                      child: Column(
                        children: [
                          Flexible(
                            flex: 2,
                            fit: FlexFit.loose,
                            child: MusicTagItem(
                              name: "Yêu Đơn Phương Là Gì (MEE...",
                            ),
                          ),
                          Flexible(
                            flex: 0,
                            child: SizedBox(
                              height: 5,
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            fit: FlexFit.loose,
                            child: MusicTagItem(
                              name: "Về Nghe Mẹ Ru - NSND Bach...",
                            ),
                          ),
                          Flexible(
                            flex: 0,
                            child: SizedBox(
                              height: 5,
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            fit: FlexFit.loose,
                            child: MusicTagItem(
                              name: "Yêu Đơn Phương...",
                            ),
                          ),
                        ],
                      ),
                    )
                  ]
              ),
            )
        ),
      ],
    );
  }
}
