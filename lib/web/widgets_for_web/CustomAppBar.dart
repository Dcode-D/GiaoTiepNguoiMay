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
  late TextEditingController _textEditingController;
  late Key searchKey;

  @override
  void initState() {
    print("innit controller");
    searchKey = GlobalKey();
    _textEditingController = TextEditingController();
    if(!_textEditingController.hasListeners){
      _textEditingController.addListener(() {
        setState(() {
          // _textEditingController.value = _textEditingController.value.copyWith(text: _textEditingController.text,
          //   selection: TextSelection.collapsed(offset: _textEditingController.text.length)
          // );
        });
      });
    }
    super.initState();
  }
  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
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
                height: size.height/15,
                decoration: BoxDecoration(
                  color: searchbar,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: searchbarBorder,width: 1.5)
                ),
                child: Row(
                  children: <Widget>[
                        Flexible(
                          flex: 10,
                          fit: FlexFit.tight,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child:
                          _textEditingController.text.length==0?
                            SearchField(
                              key: searchKey,
                              controller: _textEditingController,
                              searchInputDecoration: InputDecoration(
                                  hintText: "Search",
                                  hintStyle: TextStyle(color: Color.fromARGB(255, 120, 120, 120),
                                  fontSize: 18,
                                  fontFamily: "Poppins",),
                                  border: InputBorder.none
                                ),
                              onSuggestionTap: (listitem){
                                Navigator.of(context).push(PageRouteBuilder(pageBuilder: (_,a1,a2)=>VideoResultScreen()));
                              },
                              onSubmit: (input){
                                Navigator.of(context).push(PageRouteBuilder(pageBuilder: (_,a1,a2)=>VideoResultScreen()));
                              },
                              suggestions: historyList.map((e) =>
                              SearchFieldListItem(e,
                                  child: ListTile(
                                    leading: Icon(Icons.history),
                                    title: Text(e),
                                    trailing: Icon(Icons.clear),
                                  )
                              )
                            ).toList(),
                            )
                            :
                          SearchField(
                            key: searchKey,
                            controller: _textEditingController,
                            searchInputDecoration: InputDecoration(
                                hintText: "Search",
                                hintStyle: TextStyle(color: Color.fromARGB(255, 120, 120, 120),
                                  fontSize: 18,
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
                                SearchFieldListItem(e,
                                    child: ListTile(
                                      leading: Icon(Icons.search),
                                      title: Text(e),
                                    )
                                )
                            ).toList(),
                          )
                            ,
                          ),
                        ),
                    Flexible(
                      flex: 1,
                      child: Icon(Icons.search,
                        color:Color.fromARGB(255, 120, 120, 120),),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                width: size.width/8,
                height: size.height/15-5.3,
                child: Row(
                  children: <Widget>[
                    Flexible(
                        flex: 3,
                        child: Image.asset("assets/images/instagram.jpg",height: 35,)),
                    Flexible(
                        flex: 2,
                        child: SizedBox(width: 30,)),
                    Flexible(
                        flex: 3,
                        child: Image.asset("assets/images/notification.jpg",height: 35,)),
                    Flexible(
                        flex: 2,
                        child: SizedBox(width: 30,)),
                    Flexible(
                      flex:8,
                      child: InkWell(
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
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      )
    );
  }
}

List historyList = ["Naruto iu sasuke","con cho nha hang xom","Hieu bach tuoc", "Thoi anh choi luon","Choay pho", "con gai co hang xom","Ba cu lang ben"];
List suggestlist = ["Phim hay","Vl conheo","Rap cham thoi","Ghe dit bu","Em la bad girl","Meo rot duoi","anh ko choi dau"];