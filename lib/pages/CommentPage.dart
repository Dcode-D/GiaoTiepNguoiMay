import 'package:doangtnm/widgets/commentItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../constant/data_json.dart';

class commentPage extends StatelessWidget{
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
                      itemCount: CommentList.length+1,
                      itemBuilder: (context, index)
                          {
                            return(index<CommentList.length)? commentItem(CommentList[index]["avatarUrl"], CommentList[index]["userName"], CommentList[index]["content"], "1d ago", CommentList[index]["likes"])
                            :
                            Container(
                              decoration: BoxDecoration(color: Colors.white),
                              child:
                            SizedBox(height: 200,)
                            );
                          }
                )
              )
              ),
            ],
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child:
        Container(
          padding: EdgeInsets.all(0),
          decoration: BoxDecoration(color: Colors.white,
            border: Border(top: BorderSide(width: 1)),
          ),
          child:
          ListTile(
            title: TextField(
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                labelText: 'Comment',
                labelStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            trailing: TextButton(
              onPressed: () {},
              child: const Text(
                'Send',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        )
        ),
    ]
    )
    )
    )
    );
  }
}