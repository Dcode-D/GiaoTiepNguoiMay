import 'package:flutter/material.dart';
import 'package:doangtnm/widgets/LikeComponent.dart';
import 'package:doangtnm/web/screens_for_web//HomeScreen.dart';
import 'package:doangtnm/widgets/profile_image.dart';

import '../../constant/data_json.dart';
import '../../widgets/commentItem.dart';
import '../../theme/Colors.dart';


class RightPanelComments extends StatefulWidget {
  @override
  _DetailVideoScreenState createState() => _DetailVideoScreenState();
}

class _DetailVideoScreenState extends State<RightPanelComments>{
  bool isFollow = false;
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(left: 15,right: 14,top: 14,bottom: 15),
            width: size.width*0.35-32,
            color: Colors.white,
          child: Container(
            padding: EdgeInsets.only(left: 30,right: 30,top: 20),
            width: size.width*0.4,
            decoration: BoxDecoration(
              /*color: Colors.blue,*/
              color: Color.fromARGB(255, 248, 248, 248),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipOval(
                          child: 
                            Image.asset('assets/images/cat1.jpg',
                            width: 50, height: 50, fit: BoxFit.cover),
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
                        )
                      ],
                    ),
                    SizedBox(height: 18,),
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
                    SizedBox(height: 20,),
                    Row(
                      children: [
                          InkWell(
                            onTap: (){
                              setState(() {
                                isLiked = !isLiked;
                              });
                            },
                            child: Row(
                              children:[
                                Icon(
                                  isLiked ? Icons.favorite : Icons.favorite_border,
                                  color: isLiked ? Colors.red : Colors.black,
                                  size: 30,
                                ),
                                SizedBox(width: 5,),
                                Text(isLiked ? '77' : '76',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w600
                                  ),),
                              ]
                            ),
                          ),
                        SizedBox(width: 20,),
                        Icon(Icons.chat,
                            color: Colors.black,
                          size: 30,),
                        SizedBox(width: 5,),
                        Text('23',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600
                          ),),
                        Spacer(),
                        Icon(Icons.share,
                          color: Color.fromARGB(255, 242, 113, 33),
                          size: 30,),
                      ]
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: size.width*0.4,
                      height: 1.5,
                      color: Colors.black.withOpacity(0.2),
                    ),
                    SizedBox(height: 10,),
                    SingleChildScrollView(
                      child: Container(
                        height: size.height*0.65,
                          decoration: BoxDecoration(color: Colors.transparent),
                          child:
                          ListView.builder(
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
                    SizedBox(height: 15,),
                    Center(
                      child: Container(
                        width: 520,
                        height: 60,
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
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}