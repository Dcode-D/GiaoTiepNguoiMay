import 'package:doangtnm/web/widgets_for_web/EditProfileDialog.dart';
import 'package:doangtnm/web/widgets_for_web/LoginDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:searchfield/searchfield.dart';

import '../../pages/SwitchAccountPage.dart';
import '../../theme/Colors.dart';
import '../screens_for_web/VideoResultScreen.dart';

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
      padding: EdgeInsets.only(top: 10,left: 50,right: 50, bottom: 10),
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
                width: size.width/3,
                height: size.height/15+5,
                decoration: BoxDecoration(
                  color: searchbar,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: searchbarBorder,width: 1.5)
                ),
                child: Row(
                  children: <Widget>[
                        Flexible(
                          flex: 10,
                          child: SearchField(
                            searchInputDecoration: InputDecoration(
                                hintText: "Search",
                                hintStyle: TextStyle(color: Color.fromARGB(255, 120, 120, 120),
                                fontFamily: "Poppins",),
                                border: InputBorder.none
                              ),
                            onSuggestionTap: (listitem){
                              Navigator.of(context).push(PageRouteBuilder(pageBuilder: (_,a1,a2)=>VideoResultScreen()));
                            },
                            onSubmit: (input){
                              Navigator.of(context).push(PageRouteBuilder(pageBuilder: (_,a1,a2)=>VideoResultScreen()));
                            },
                            suggestions: suggestlist.map((e) =>
                            SearchFieldListItem(e)
                          ).toList(),
                            // decoration: InputDecoration(
                            //   hintText: "Search",
                            //   hintStyle: TextStyle(color: Color.fromARGB(255, 120, 120, 120),
                            //   fontFamily: "Poppins",),
                            //   border: InputBorder.none
                            // ),
                          ),
                        ),
                    Flexible(
                      flex: 1,
                      child: Icon(Icons.search,
                        color:Color.fromARGB(255, 120, 120, 120),),
                    )
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
                      showGeneralDialog(
                          barrierLabel: "Close dialog",
                          barrierColor: Colors.black.withOpacity(0.5),
                          barrierDismissible: true,
                          transitionDuration: Duration(milliseconds: 200),
                          context: currentKey.currentContext!,
                          pageBuilder: (context,animation,animation2)=>
                                        Dialog(
                                          alignment: Alignment.center,
                                              child: Container(
                                                width: size.width/2,
                                                height: size.height/2,
                                                child: LoginDialog(),
                                              ),
                              ),
                          transitionBuilder: (context,animation1,animation2,child){
                            return
                              // SlideTransition(position: Tween(begin: Offset(0.2,1), end: Offset(0.2, 0.2))
                              //     .animate(animation1),
                              //   child: child,);
                            ScaleTransition(scale: animation1,
                              child: child,
                              //animation start point
                              alignment: Alignment.topRight,
                            );
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

List suggestlist = ["Phim hay","Vl conheo","Giap cham thoi","Ghe dit bu","Iem la bad girl","Meo rot duoi","ko choi 420 dau"];