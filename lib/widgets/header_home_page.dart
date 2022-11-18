import 'package:flutter/material.dart';
import 'package:doangtnm/theme/colors.dart';

class HeaderHomePage extends StatelessWidget {
  const HeaderHomePage({
     Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Following",
          style: TextStyle(
            color: white.withOpacity(0.7),
            fontSize: 20,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          "|",
          style: TextStyle(
            color: white.withOpacity(0.3),
            fontSize: 20,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          "For You",
          style: TextStyle(
              color: white, fontSize: 20, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}