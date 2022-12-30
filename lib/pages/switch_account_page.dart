import 'package:doangtnm/widgets/accountitem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../constant/data_json.dart';

class switchaccountPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Key currentKey = new GlobalKey();
    return Scaffold(
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
      Stack(children:[
        SizedBox(
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                Container(
                  height:10,
                  decoration:BoxDecoration(color: Colors.white),
                    child:
                    Align(
                        alignment: Alignment.center,
                        child:
                        SizedBox(
                          width: size.width/4,height: 6,child:
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(3),
                              color: Colors.grey),
                          // padding: EdgeInsets.only(left: size.width/3, right: size.width/3),
                        ),
                        )
                    )),
                Expanded(
                  child:
                  Container(
                      decoration: BoxDecoration(color: Colors.white),
                      child:
                  ListView.builder(
                    physics: BouncingScrollPhysics(),
                        itemCount: AccountList.length+1,
                        itemBuilder: (context, index)
                            {
                              return(index<AccountList.length)? accountItem(AccountList[index]["avatarUrl"], AccountList[index]["userName"],AccountList[index]["tag"] ,AccountList[index]["logged"])
                              :
                              Container(
                                height: 100,
                                child:
                                Align(
                                  alignment: Alignment.center,
                                  child:
                                  Text("Add Account",style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),),
                                ),
                              );
                            }
                    )
                  )
                )
              ],
            )
        )
      ])
    )));
  }
}