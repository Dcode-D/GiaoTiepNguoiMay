import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/profile_image.dart';
import '../widgets/video_thumbnail.dart';
import 'other_profile_page.dart';

class SearchResultPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
        Row(
          children: [
            Expanded(child:
            GridView.builder(
              shrinkWrap: true,
              itemCount: 10,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 2,
              ),
              itemBuilder: (context, index) {
                return
                Column(
                children:[

                  SizedBox(
                      height:MediaQuery.of(context).size.height/5,
                      child:
                  VideoThumbnail("assets/images/cat1.jpg", "1.5M")),
                Row(
                children:[
                  Align(
                      alignment:Alignment.centerLeft,
                      child:
                      SizedBox(
                        width: 30,
                        height:30,
                        child:
                        profileAvt("assets/images/cat5.jpg"),
                      )
                  ),
                Flexible(child:
                Text("How i met your mother and something came at us!", style: TextStyle(fontSize: 12,color: Colors.grey),overflow: TextOverflow.ellipsis,)),
                ]
                )
                ]);
              },
            )
            )
          ],
        );
  }
}

class profileAvt extends StatelessWidget{
  String imgUrl;
  profileAvt(this.imgUrl);
  @override
  Widget build(BuildContext context) {
    return
      InkWell(
          onTap: (){
            Navigator.push(context, PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => OtherProfileScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.ease;

                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            ));
          },
          child:
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: Image.asset(imgUrl).image,
                    fit: BoxFit.cover)),
          )
      );
  }
}