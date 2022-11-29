import 'package:doangtnm/widgets/commentItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/data_json.dart';

class commentPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:
      GestureDetector(
          onTap: (){FocusScope.of(context).requestFocus(new FocusNode());},
          child:
      Stack(children:[

        Container(
            margin: EdgeInsets.only(top: 5),
            child:
        Align(
            alignment: Alignment.topCenter,
            child:
            SizedBox(
              width: size.width/4,height: 5,child:
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(3),
          color: Colors.grey),
          // padding: EdgeInsets.only(left: size.width/3, right: size.width/3),
        ),
        )
        )),
      SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child:  ListView.builder(
                      itemCount: CommentList.length,
                      itemBuilder: (context, index)
                          {
                            return commentItem(CommentList[index]["avatarUrl"], CommentList[index]["userName"], CommentList[index]["content"], "1d ago", CommentList[index]["likes"]);
                          }
                )
              ),
            ],
          ),
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
    );
  }
}