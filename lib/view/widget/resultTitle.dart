import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizmopile/core/constant/app_color.dart';


class resultTitle extends StatelessWidget {
  const resultTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      const  Text(
           "your ",
           style: TextStyle(
            fontWeight: FontWeight.w500, 
            fontSize: 35
           ),
        ),
        Text(
           "R",
          style: TextStyle(
            color: appColors.primaryColor,
            fontWeight: FontWeight.w500, 
            fontSize: 35
           ),
        ),
        Text(
           "esult ",
            style: TextStyle(
            color: appColors.secondaryColor,
            fontWeight: FontWeight.w500, 
            fontSize: 35
           ),
        ),
        Text(
           "is :",
            style: TextStyle(
           // color: appColors.primaryColor,
            fontWeight: FontWeight.w500, 
            fontSize: 35
           ),

        ),
      ],
    );
  }
}