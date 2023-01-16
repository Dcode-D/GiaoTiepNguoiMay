import 'package:doangtnm/pages/LoginPage.dart';
import 'package:doangtnm/widgets/accountitem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../constant/data_json.dart';

class switchaccountPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    GlobalKey currentKey = new GlobalKey();
    return
      Scaffold(
      backgroundColor: Colors.black.withOpacity(0),
      resizeToAvoidBottomInset: true,
      body:
      Dismissible(
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
                        height: size.height/2.5,
                      child: Column(
                        children: [
                          Container(
                              height:10,
                              decoration:BoxDecoration(color: Colors.white,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                              ),
                              child:
                              Align(
                                  alignment: Alignment.center,
                                  child:
                                  SizedBox(
                                    width: size.width/4,height: 0,child:
                                  Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    // padding: EdgeInsets.only(left: size.width/3, right: size.width/3),
                                  ),
                                  )
                              )),
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
                                  title: Text("Switch Account",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                                  centerTitle: true,
                                  leading: Container(),
                                  backgroundColor: Colors.white,
                                  toolbarHeight: 28.5,
                                  actions: [
                                    IconButton(
                                      icon: Icon(Icons.close,color: Colors.black,),
                                      onPressed: () {
                                      },
                                    ),
                                  ],
                                )
                            /*Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child:  Text("Switch Account", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                ),
                                Icon(Icons.close, color: Colors.black,size: 20,)
                              ],
                            )*/
                          ),
                          Expanded(
                              child:
                              Container(
                                constraints: new BoxConstraints(
                                  maxHeight: size.height,
                                ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,

                                  ),
                                  child:
                                  ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      itemCount: AccountList.length+1,
                                      itemBuilder: (context, index)
                                      {
                                        return(index<AccountList.length)? accountItem(AccountList[index]["avatarUrl"], AccountList[index]["userName"],AccountList[index]["tag"] ,AccountList[index]["logged"])
                                            :
                                        Align(
                                            alignment: Alignment.bottomLeft,
                                            child:
                                            InkWell(
                                              onTap: (){
                                                showGeneralDialog(
                                                    barrierLabel: "Close dialog",
                                                    barrierColor: Colors.black.withOpacity(0.5),
                                                    barrierDismissible: true,
                                                    transitionDuration: Duration(milliseconds: 300),
                                                    context: currentKey.currentContext!,
                                                    pageBuilder: (context,animation,animation2)=>
                                                        Container(

                                                            child:
                                                            LoginPage()
                                                        ),
                                                    transitionBuilder: (context,animation1,animation2,child){
                                                      return
                                                        SlideTransition(position: Tween(begin: Offset(0, 1), end: Offset(0, 0.2))
                                                            .animate(animation1),
                                                          child: child,);
                                                    }
                                                );
                                              },
                                              child: Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Row(
                                                      children:[
                                                        SizedBox(width: 15,),
                                                        SizedBox(
                                                          width: 40,
                                                          height: 40,
                                                          child:
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                color: Color.fromARGB(255, 234, 234, 234),
                                                                borderRadius: BorderRadius.circular(20)
                                                            ),
                                                            child:
                                                            Icon(Icons.add, color: Colors.black,),
                                                          ),
                                                        ),
                                                        SizedBox(width: 18,),
                                                        Text("Add Account",style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.w500
                                                        ),),
                                                      ])
                                              ),
                                            )
                                        );
                                      }
                                  )
                              )
                          )],
                      )
                  ),
                ])
          ],
        )
      ))
      );
  }
}