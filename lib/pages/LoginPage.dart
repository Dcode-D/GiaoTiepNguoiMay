import 'package:doangtnm/widgets/accountitem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constant/data_json.dart';

class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    GlobalKey currentKey = new GlobalKey();
    return
      Scaffold(
          backgroundColor: Colors.black.withOpacity(0),
          resizeToAvoidBottomInset: true,
          body:
          Container(
            decoration:BoxDecoration(color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
            ),
            child: Dismissible(
                key: currentKey,
                direction: DismissDirection.down,
                onDismissed: (_)=>Navigator.of(context).pop(),
                child:
                GestureDetector(
                    onTap: (){FocusScope.of(context).requestFocus(new FocusNode());},
                    child:
                    Column(
                      children: [
                        Stack(
                            children:[
                              SizedBox(
                                  width: size.width,
                                  height: size.height/1,
                                  child: Column(
                                    children: [
                                      Container(
                                          height:10,
                                          /*decoration:BoxDecoration(color: Colors.white,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(100),topRight: Radius.circular(100))
                                          ),*/
                                          child:
                                          Align(
                                              alignment: Alignment.center,
                                              child:
                                              SizedBox(
                                                width: size.width,height: 0,
                                                child: Container(
                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(0),
                                                    color: Colors.white),
                                                // padding: EdgeInsets.only(left: size.width/3, right: size.width/3),
                                              ),
                                              )
                                          )
                                      ),
                                          Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.white,
                                                width: 0,
                                              ),
                                            ),
                                          ),
                                          child:
                                          AppBar(
                                            title: Text("",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                                            centerTitle: true,
                                            leading: Container(),
                                            backgroundColor: Colors.white,
                                            toolbarHeight: 40,
                                            actions: [
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: IconButton(
                                                  icon: Icon(Icons.close,color: Colors.black,size: 30,),
                                                  onPressed: () {
                                                  },
                                                ),
                                              ),
                                              SizedBox(width: 305,
                                              ),
                                              IconButton(
                                                icon: Icon(Icons.help_outline,color: Colors.black,size: 30,),
                                                onPressed: () {
                                                },
                                              ),
                                              SizedBox(width: 5,
                                              ),
                                            ],
                                          )
                                      ),
                                      Expanded(
                                          child: Column(
                                            children: [
                                              Container(
                                                color: Colors.white,
                                                child: Center(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text("Sign up for TicTac",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                color: Colors.white,
                                                child: Center(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text("Create a profile, follow other accounts,\n    make your own videos, and enjoy",
                                                      style: TextStyle(color: Color.fromARGB(255, 120, 120, 120),fontSize: 16,fontWeight: FontWeight.w600),),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 28,),
                                              Container(
                                                  height: 56,
                                                  width: 299,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border.all(
                                                        color: Color.fromARGB(255 , 120, 120, 120),
                                                      ),
                                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                                  ),
                                                  child: Row(
                                                      children:[
                                                        Container(
                                                          // decoration: BoxDecoration(color: Colors.blue),
                                                            child:
                                                            Image.network(
                                                              'http://pngimg.com/uploads/google/google_PNG19635.png',
                                                              fit:BoxFit.fill,
                                                            )
                                                        ),
                                                        SizedBox(
                                                          width: 20.0,
                                                        ),
                                                        Text('Continue with Google',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
                                                      ]
                                                  )
                                              ),
                                              SizedBox(height: 20,),
                                              Container(
                                                  height: 56,
                                                  width: 299,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border.all(
                                                        color: Color.fromARGB(255 , 120, 120, 120),
                                                      ),
                                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                                  ),
                                                  child: Row(
                                                      children:[
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        Container(
                                                          // decoration: BoxDecoration(color: Colors.blue),
                                                            child:
                                                            Icon(FontAwesomeIcons.facebook, color: Colors.blue, size: 40.0)
                                                        ),
                                                        SizedBox(
                                                          width: 24.0,
                                                        ),
                                                        Text('Continue with Facebook',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
                                                      ]
                                                  )
                                              ),
                                              SizedBox(height: 190,),
                                              Container(
                                                color: Colors.white,
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text("Already have account?",
                                                        style: TextStyle(color: Color.fromARGB(255, 120, 120, 120),fontSize: 16,fontWeight: FontWeight.w500),),
                                                      Text(" Log in",
                                                        style: TextStyle(color: Color.fromARGB(255, 242, 133, 33),fontSize: 16,fontWeight: FontWeight.w500),),
                                                    ]
                                                  ),
                                                ),
                                              ),
                                            ],

                                          ))
                                    ],
                                  )
                              ),
                            ])
                      ],
                    )
                )),
          )
      );
  }
}