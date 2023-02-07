import 'package:flutter/material.dart';
import 'package:doangtnm/theme/Colors.dart';

import '../../widgets/profile_image.dart';

class EditProfileDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    GlobalKey currentKey = new GlobalKey();
    return Scaffold(
        backgroundColor: Colors.black.withOpacity(0),
        resizeToAvoidBottomInset: true,
        body:
            Container(
              height: size.height*0.6+27,
              padding: EdgeInsets.only(top: 10,left: 20,right: 20, bottom: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                        width: size.width*0.6,
                        height:1.5,
                        color: Colors.black.withOpacity(0.3),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: size.width*0.6,
                      child: Row(
                        children: [
                          Text(
                            'Profile picture',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Inter',
                            ),
                          ),
                          SizedBox(width: size.width*0.15,),
                          Center(
                            child: Stack(
                              children: [
                                Container(
                                  width: 130,
                                  height: 130,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.transparent),
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'assets/images/cat1.jpg'),
                                          fit: BoxFit.cover)),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 223, 223, 233),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                        width: size.width*0.6,
                        height:1.5,
                        color: Colors.black.withOpacity(0.3),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text(
                          'TicTac ID',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Inter',
                          ),
                        ),
                        SizedBox(width: 50,),
                        Container(
                          width: size.width*0.4,
                          height: 50,
                          padding: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              color: searchbar,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: searchbarBorder,width: 1.5)
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "TicTac ID",
                                hintStyle: TextStyle(color: Color.fromARGB(255, 191, 191, 191),
                                  fontFamily: "Inter",),
                                border: InputBorder.none
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text('TicTac ID is your unique ID on TicTac. You can change it once a month.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                        width: size.width*0.6,
                        height:1.5,
                        color: Colors.black.withOpacity(0.3),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Inter',
                          ),
                        ),
                        SizedBox(width: 82,),
                        Container(
                          width: size.width*0.4,
                          height: 50,
                          padding: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              color: searchbar,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: searchbarBorder,width: 1.5)
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "Name",
                                hintStyle: TextStyle(color: Color.fromARGB(255, 191, 191, 191),
                                  fontFamily: "Inter",),
                                border: InputBorder.none
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text('You can change your name once a month.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: size.width*0.6,
                      height:1.5,
                      color: Colors.black.withOpacity(0.3),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text(
                          'History',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Inter',
                          ),
                        ),
                        SizedBox(width: 66,),
                        Container(
                          width: size.width*0.4,
                          height: 100,
                          padding: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              color: searchbar,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: searchbarBorder,width: 1.5)
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "History",
                                hintStyle: TextStyle(color: Color.fromARGB(255, 191, 191, 191),
                                  fontFamily: "Inter",),
                                border: InputBorder.none
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: size.width*0.6,
                      height:1.5,
                      color: Colors.black.withOpacity(0.3),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: (){
                                Navigator.pop(context);
                            },
                            child: Container(
                              width: 150,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.black.withOpacity(0.5),width: 1.5)
                              ),
                              child: Center(
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black.withOpacity(0.5),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Inter',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20,),
                          InkWell(
                            onTap: (){

                            },
                            child: Container(
                              width: 150,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 242, 113, 33),
                                  borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'Save',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Inter',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
  }

}