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
              Icon(Icons.search,color: Colors.black,size: 27,),
              SizedBox(width: MediaQuery.of(context).size.width/30,)
            ],
          ),
          body:
              ListView.builder(
                itemBuilder: (context,index)=>
                Container(
                    margin: EdgeInsets.only(top: 5),
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
            Text(hastag,
              style: TextStyle(
                color: Colors.orange,
                      fontSize: 16,
              ),
            )
            ),
            SizedBox(height: 10,),
            SizedBox(
                height: MediaQuery.of(context).size.height/6,
                child:
            ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return
                    SizedBox(
                      height:MediaQuery.of(context).size.height/6 ,
                      width: MediaQuery.of(context).size.height/6,
                      child:
                      VideoThumbnail(videoUrl,"100M"),
                    );
              },
            )
            )
          ],
    );
  }
}