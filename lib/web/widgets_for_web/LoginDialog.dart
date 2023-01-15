import 'package:flutter/material.dart';
import 'package:doangtnm/theme/Colors.dart';

class LoginDialog extends StatefulWidget {
  const LoginDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginDialog> createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog>{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 680,
      height: 530,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children:[
          SizedBox(height: 10,),
          Image.asset("assets/images/logo.jpg",width: 140,height: 40,),
          SizedBox(height: 20,),
          Container(
            width: 500,
            height: 50,
            padding: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                color: searchbar,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: searchbarBorder,width: 1.5)
            ),
            child: Expanded(
              child: TextField(
                decoration: InputDecoration(
                    hintText: "UserName",
                    hintStyle: TextStyle(color: Color.fromARGB(255, 191, 191, 191),
                      fontFamily: "Inter",),
                    border: InputBorder.none
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            width: 500,
            height: 50,
            padding: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                color: searchbar,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: searchbarBorder,width: 1.5)
            ),
            child: Expanded(
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Color.fromARGB(255, 191, 191, 191),
                      fontFamily: "Inter",),
                    border: InputBorder.none
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          InkWell(
            onTap: (){},
            child: Text('Forgot password ?',style: TextStyle(color: Colors.black,fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w300, fontStyle: FontStyle.italic),),
          ),
          SizedBox(height: 10,),
          InkWell(
            onTap: (){},
            child: /*Image.asset('assets/images/loginbtn.jpg',width: 600,height: 60,fit: BoxFit.fill,),*/
              Container(
                width:500,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 242, 113, 33),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 20, fontFamily: 'Inter', fontWeight: FontWeight.w500),),
                ),
              )
          ),
          SizedBox(height: 10,),
          InkWell(
            onTap: (){},
            child: Container(
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color.fromARGB(255,242,113,33),width: 1.5)
              ),
              child: Center(child: Text(
                'Create new account'
                ,style: TextStyle(color: Colors.black,fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w500),),
                ),
              ),
            ),
          SizedBox(height: 10,),
          InkWell(
            onTap: (){},
            child: Container(
              width: 250,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color.fromARGB(255,242,113,33),width: 1.5)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/google.png',width: 20,height: 20,),
                  SizedBox(width: 10,),
                  Text(
                    'Login with Google'
                    ,style: TextStyle(color: Colors.black,fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w500),),
                ],
              ),
          ),
          ),
          SizedBox(height: 10,),
          InkWell(
            onTap: (){},
            child: Container(
              width: 250,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color.fromARGB(255,242,113,33),width: 1.5)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.facebook,color: Colors.blue,),
                  SizedBox(width: 10,),
                  Text(
                    'Login with FaceBook'
                    ,style: TextStyle(color: Colors.black,fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w500),),
                ],
              ),
            ),

          )
        ]),
    );
  }

}