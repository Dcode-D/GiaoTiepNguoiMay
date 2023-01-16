import 'package:flutter/material.dart';
import 'package:doangtnm/theme/Colors.dart';

import '../../widgets/profile_image.dart';

class EditProfileDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    GlobalKey currentKey = new GlobalKey();
    return Scaffold(
        backgroundColor: Colors.black.withOpacity(0),
        resizeToAvoidBottomInset: true,
        body:Dismissible(
            key: currentKey,
            direction: DismissDirection.down,
            onDismissed: (_)=>Navigator.of(context).pop(),
            child:
            GestureDetector(
              onTap: (){FocusScope.of(context).requestFocus(new FocusNode());},
              child:

              Container(
                height: size.height*0.5,
                padding: EdgeInsets.only(top: 10,left: 20,right: 20, bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                          width: size.width*0.6,
                          height:1.5,
                          color: Colors.black.withOpacity(0.3),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: size.width*0.6,
                        child: Row(
                          children: [
                            Text(
                              'Profile picture',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Inter',
                              ),
                            ),
                            SizedBox(width: size.width*0.2,),
                            Center(
                              child: Stack(
                                children: [
                                  Container(
                                    width: 130,
                                    height: 130,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Color.fromARGB(255, 242, 113, 33)),
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'assets/images/cat1.jpg'),
                                            fit: BoxFit.cover)),
                                  )
                                ],
                              )
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            )));
  }

}