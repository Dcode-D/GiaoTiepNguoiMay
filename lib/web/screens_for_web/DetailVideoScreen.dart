import 'package:flutter/material.dart';
import 'package:doangtnm/widgets/LikeComponent.dart';
import 'package:doangtnm/web/screens_for_web//HomeScreen.dart';
import 'package:doangtnm/widgets/profile_image.dart';

import '../../pages/CommentPage.dart';

class DetailVideoScreen extends StatefulWidget {
  @override
  _DetailVideoScreenState createState() => _DetailVideoScreenState();
}

class _DetailVideoScreenState extends State<DetailVideoScreen>{
  bool isFollow = false;
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
        Container(
          padding: EdgeInsets.only(left: 15,right: 14,top: 14,bottom: 15),
            width: size.width*0.4,
            color: Colors.orange,
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

                    SizedBox(
                        width: size.width,
                          height: size.height/1.7,
                          child:
                        commentPage()
                      ),

                  ],
                )
              ],
            ),
          ),
        );
  }
}