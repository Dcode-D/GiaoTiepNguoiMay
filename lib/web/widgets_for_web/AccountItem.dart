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

      },
      child: Row(
        children: [
          Flexible(
            flex: 0,
            fit: FlexFit.loose,
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(widget.avataUrl),
            ),
          ),
          Flexible(
              child: SizedBox(width: 10,)),
          Flexible(
            fit: FlexFit.loose,
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 0,
                  fit: FlexFit.loose,
                  child: Container(
                    width: 200,
                    height: 30,
                    child: Row(
                      children: [

                        Flexible(
                          flex: 3,
                          fit: FlexFit.loose,
                          child: Padding(
                            padding: const EdgeInsets.all(0),
                            child: Text(widget.name,style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "Popins",
                                fontWeight: FontWeight.w700
                            ),),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                            child: SizedBox(width: 5,)),
                        Flexible(
                          flex: 0,
                          fit: FlexFit.loose,
                          child: Icon(Icons.check_circle,color: Color.fromARGB(255, 242, 113, 33),
                            size: 15,),
                        )
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 4,
                  fit: FlexFit.loose,
                  child: Text(widget.tag,style: TextStyle(
                      color: Color.fromARGB(255, 87, 87, 87),
                      fontSize: 14,
                      fontFamily: "Popins",
                      fontWeight: FontWeight.w400
                  ),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}