import 'package:doangtnm/widgets/followaccount.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/data_json.dart';

class followerList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        resizeToAvoidBottomInset: false,
    appBar: AppBar(
      backgroundColor: Colors.white,
      leading:
      InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child:
          Icon(
            Icons.arrow_back,
            color: Colors.black,
          )),
      title: Text(
        "Followers",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    ),
    body:
    GestureDetector(
    onTap: (){FocusScope.of(context).requestFocus(new FocusNode());},
    child:
      Column(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(3)),
    child:
        ListTile(
          leading:
            Container(
              child: Icon(Icons.search,size: 25,color: Colors.white,),
            ),
            title:
            TextField(
              style: TextStyle (
                fontSize: 16,
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                fillColor: Colors.white,
                hintText: "Search",
                border: InputBorder.none
              ),
            )
        )
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: listfollowers.length,
              itemBuilder: (context,index)=>followaccountitem(listfollowers[index]["imageUrl"], listfollowers[index]["userName"])),
        )
      ],
    )
      )
      );
  }
}