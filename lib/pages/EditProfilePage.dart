import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      //appbar
      appBar: AppBar(
        backgroundColor: Colors.white,
        //back arrow
        leading:
            InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child:
        Icon(Icons.arrow_back,size: 25,color: Colors.black,)
            ),

        //title
        title:
        Text('Profile',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Colors.black
          ),
        ),
      ),

      //Screen body
      body:
          SingleChildScrollView(
            child:       Column(children: [
              Align(
                  alignment: Alignment.topCenter,
                  child:
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 125,
                    width: 125,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: Image.asset('assets/images/cat1.jpg').image,fit: BoxFit.fill),
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.5)
                      ),
                      child:Icon(Icons.camera_alt_outlined,size: 30,color: Colors.white,),
                    ),
                  )
              ),
              SizedBox(height: 5,),
              Align(
                alignment: Alignment.topCenter,
                child: Text("Change photo",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontSize: 17
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child:
                  Container(
                      margin: EdgeInsets.only(left: 10, top: 20),
                      child:
                      Text("About you",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.grey,
                            fontSize: 17
                        ),
                      )
                  )
              ),

              infoItem(title: "Name", info: "Mr.CatInLove"),
              infoItem(title: "Username", info: "Heyhey"),
              infoItem(title: "Email", info: "MeowMeow@gmail.com"),
              infoItem(title: "Bio", info: "Add a bio"),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Tictac.com/profile?id=meowmoew",style: TextStyle(
                      fontSize: 16
                  ),),
                  SizedBox(width: 10,),
                  Icon(Icons.copy,size: 20, color: Colors.black,),
                  SizedBox(width: 5,)
                ],
              ),
              SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 2,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.7),
                ),
              ),

              Align(
                  alignment: Alignment.centerLeft,
                  child:
                  Container(
                      margin: EdgeInsets.only(left: 10, top: 20),
                      child:
                      Text("Social",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.grey,
                            fontSize: 17
                        ),
                      )
                  )
              ),


              infoItem(title: "Instagram", info: "Add instagram"),
              infoItem(title: "Youtube", info: "Add youtube"),

            ],
            ),
          )
    );
  }

}

class infoItem extends StatelessWidget{
  String title,info;
  infoItem({required this.title, required this.info});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10,top: 20,right: 5),
      child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
            Text(info,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey
              ),
            ),
            SizedBox(width: 10,),
            Icon(Icons.arrow_forward_ios, color: Colors.grey,),
              ]
            )
          ],

        )
      ,
    );
  }
}