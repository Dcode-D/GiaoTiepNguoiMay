import 'package:doangtnm/web/screens_for_web/AccountScreen.dart';
import 'package:doangtnm/web/screens_for_web/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:doangtnm/theme/Colors.dart';

class AccountItem extends StatefulWidget{
  final String avataUrl;
  final String name;
  final String tag;

  AccountItem({Key? key,
    required this.avataUrl,
    required this.name,
    required this.tag
  }) : super(key: key);

  @override
  _AccountItemState createState() => _AccountItemState();
}

class _AccountItemState extends State<AccountItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
          },
      child: ListTile(
        leading:
           CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(widget.avataUrl),
            ),
        title:
                Row(
                  children: [
                    Text(widget.name,style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: "Popins",
                                    fontWeight: FontWeight.w700
                                ),),
                    SizedBox(width: 5,),
                    Icon(Icons.check_circle,color: Color.fromARGB(255, 242, 113, 33),
                      size: 15,),
                  ],
                ),

        trailing:
                   SizedBox(),

        subtitle:
                Text(widget.tag,style: TextStyle(
                      color: Color.fromARGB(255, 87, 87, 87),
                      fontSize: 14,
                      fontFamily: "Popins",
                      fontWeight: FontWeight.w400
            ),
          ),
      )
    );
  }

}