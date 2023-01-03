import 'package:doangtnm/widgets/SearchingDelegate.dart';
import 'package:doangtnm/widgets/video_thumbnail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DiscoveryPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var listvideotag = ["#trending","#Lunar new year","#rabit","#Theanh69","#New_year_style"];
    return
        Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Icon(Icons.public,color: Colors.black,),
            title: Text("Discovery",
                    style: TextStyle(
                color: Colors.black,
                    fontWeight: FontWeight.w700,
                      fontSize: 25
            ),
            ),
            actions: [
              IconButton(onPressed: (){
                showSearch(context: context, delegate: SearchingDelegate());
              }, icon: Icon(Icons.search,color: Colors.black,size: 27,))
              ,
              SizedBox(width: MediaQuery.of(context).size.width/30,)
            ],
          ),
          body:
              ListView.builder(
                itemBuilder: (context,index)=>
                Container(
                    margin: EdgeInsets.only(top: 10),
                    child:
                    HastagVideoList(listvideotag[index],"assets/images/cat"+index.toString()+".jpg")
                ),
                itemCount: listvideotag.length,
                shrinkWrap: true,
          ),

        );
  }

}

class HastagVideoList extends StatelessWidget{
  String hastag;
  String videoUrl;
  HastagVideoList(this.hastag, this.videoUrl);
  @override
  Widget build(BuildContext context) {
    return
        Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child:
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child:
                      Text(hastag,
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ),
                      )
                  )

            ),
            SizedBox(height: 10,),
            SizedBox(
                height: MediaQuery.of(context).size.height/6,
                child:
            ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return
                Padding(
                  padding: EdgeInsets.only(left: 5,bottom: 5),
                  child:
                  Container(
                      child:
                      SizedBox(
                        height:MediaQuery.of(context).size.height/4 ,
                        width: MediaQuery.of(context).size.height/6,
                        child:
                          VideoThumbnail(videoUrl,"100M"),
                      )
                  )
                );
              },
            )
            )
          ],
    );
  }
}