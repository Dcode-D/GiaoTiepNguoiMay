import 'package:doangtnm/web/screens_for_web/AccountScreen.dart';
import 'package:flutter/material.dart';
import 'package:doangtnm/widgets/LikeComponent.dart';
import 'package:doangtnm/web/screens_for_web//HomeScreen.dart';
import 'package:doangtnm/widgets/profile_image.dart';

import '../../constant/data_json.dart';
import '../../widgets/commentItem.dart';
import '../../theme/Colors.dart';
import '../screens_for_web/ProfileScreen.dart';


class RightHomeCommentPanel extends StatefulWidget {
  @override
  _DetailVideoScreenState createState() => _DetailVideoScreenState();
}

class _DetailVideoScreenState extends State<RightHomeCommentPanel>{
  bool isFollow = false;
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
      Container(
        padding: EdgeInsets.only(left: 15,right: 14,top: 14,bottom: 15),
        color: Colors.white,
        child: Container(
            padding: EdgeInsets.only(left: 30,right: 30,top: 20),
            decoration: BoxDecoration(
              /*color: Colors.blue,*/
              color: Color.fromARGB(255, 248, 248, 248),
              borderRadius: BorderRadius.circular(20),
            ),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex:0,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Row(
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                              },
                              child: ClipOval(
                                child:
                                Image.asset('assets/images/cat1.jpg',
                                    width: 50, height: 50, fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Mr Cat',style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: "Popins",
                                    fontWeight: FontWeight.w600
                                ),),
                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Text('White Cat',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: "Popins",
                                          fontWeight: FontWeight.w500
                                      ),),
                                    SizedBox(width: 5,),
                                    Text('*',style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontFamily: "Popins",
                                        fontWeight: FontWeight.w500
                                    ),),
                                    SizedBox(width: 5,),
                                    Text('1 days ago',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: "Popins",
                                          fontWeight: FontWeight.w500
                                      ),),
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            Flexible(
                              child: Align(
                                alignment: Alignment.topRight,
                                child: InkWell(
                                  onTap: (){
                                    setState(() {
                                      isFollow = !isFollow;
                                    });
                                  },
                                  child:Text(
                                    isFollow ? 'Following' : 'Follow',
                                    style: TextStyle(
                                        color: Color.fromARGB(255,242,113,33),
                                        fontSize: 18,
                                        fontFamily: "Popins",
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text('Something you should know',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500
                          ),),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            InkWell(
                              onTap: (){

                              },
                              child: Text('#Trending ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w600
                                ),),
                            ),
                            InkWell(
                              onTap: (){

                              },
                              child: Text('#History ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w600
                                ),),
                            ),
                            InkWell(
                              onTap: (){

                              },
                              child: Text('#Creative ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w600
                                ),),
                            ),
                          ],
                        ),
                        ]
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: size.width*0.4,
                  height: 1.5,
                  color: Colors.black.withOpacity(0.2),
                ),
                SizedBox(height: 10,),
                Flexible(
                  flex: 8,
                  child: SingleChildScrollView(
                    child: Container(
                        decoration: BoxDecoration(color: Colors.transparent),
                        child:
                        ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: CommentList.length+1,
                            itemBuilder: (context, index)
                            {
                              return(index<CommentList.length)?
                              Column(
                                children: [
                                  commentItem(CommentList[index]["avatarUrl"], CommentList[index]["userName"], CommentList[index]["content"], "1d ago", CommentList[index]["likes"]),
                                  SizedBox(height: 10,),
                                ],
                              )
                                  :
                              Container(
                                  decoration: BoxDecoration(color: Colors.transparent),
                                  child:
                                  SizedBox(height: 50,)
                              );
                            }
                        )
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 520,
                      height: 60,
                      margin: EdgeInsets.only(bottom: 20),
                      padding: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 220, 220, 220),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "Comment...",
                                  hintStyle: TextStyle(color: Color.fromARGB(255, 120, 120, 120),
                                    fontFamily: "Inter",),
                                  border: InputBorder.none
                              ),
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.emoji_emotions_outlined,
                            color: Colors.black,
                            size: 30,),
                          SizedBox(width: 10,),
                          InkWell(
                            onTap: (){
                            },
                            child: Container(
                              height: 60,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 172, 172, 172),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20)
                                  )
                              ),
                              child: Center(
                                  child: Text('Post',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w600
                                    ),)
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ])
        ),
      );
  }
}