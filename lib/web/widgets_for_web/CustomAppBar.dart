import 'package:doangtnm/web/widgets_for_web/EditProfileDialog.dart';
import 'package:doangtnm/web/widgets_for_web/LoginDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../pages/SwitchAccountPage.dart';
import '../../theme/Colors.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context){
    GlobalKey currentKey = GlobalKey();
    Size size = MediaQuery.of(context).size;
    return Container(
      key: currentKey,
      padding: EdgeInsets.only(top: 15,left: 50,right: 50, bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            blurRadius: 30,
            offset: Offset(0, -2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Image.asset("assets/images/logo.jpg",height: 45,),
              Spacer(),
              Container(
                width: 500,
                height: 50,
                padding: EdgeInsets.only(left: 30,right: 30),
                decoration: BoxDecoration(
                  color: searchbar,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: searchbarBorder,width: 1.5)
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(color: Color.fromARGB(255, 120, 120, 120),
                          fontFamily: "Poppins",),
                          border: InputBorder.none
                        ),
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.search,
                      color:Color.fromARGB(255, 120, 120, 120),)
                  ],
                ),
              ),
              Spacer(),
              Row(
                children: <Widget>[
                  Image.asset("assets/images/instagram.jpg",height: 35,),
                  SizedBox(width: 30,),
                  Image.asset("assets/images/notification.jpg",height: 35,),
                  SizedBox(width: 30,),
                  InkWell(
                    onTap: (){
                      /*SmartDialog.show(
                        builder: (context) => LoginDialog(),
                        alignment: Alignment.center,
                      );*/
                      showGeneralDialog(
                          barrierLabel: "Close dialog",
                          barrierColor: Colors.black.withOpacity(0.5),
                          barrierDismissible: true,
                          transitionDuration: Duration(milliseconds: 300),
                          context: currentKey.currentContext!,
                          pageBuilder: (context,animation,animation2)=>
                              Container(
                                  child:
                                  EditProfileDialog()
                              ),
                          transitionBuilder: (context,animation1,animation2,child){
                            return
                              SlideTransition(position: Tween(begin: Offset(0,1), end: Offset(0.2, 0.2))
                                  .animate(animation1),
                                child: child,);
                          }
                      );
                    },
                    child: Container(
                      height: 45,
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: appPrimary,
                          width: 2,
                          )
                        ),
                      child: Center(
                        child: Text("Login",
                        style: TextStyle(
                          color: appPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins"
                            ),
                          ),
                        )
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      )
    );
  }
}