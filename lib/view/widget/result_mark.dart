import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizmopile/controller/resultPageController.dart';
import 'package:quizmopile/core/constant/app_color.dart';


class result_mark extends StatelessWidget {
  const result_mark({
    super.key,
    required this.c,
  });

  final resultPageController c;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          c.mark.toString(),
           
        style: TextStyle(
           // color: appColors.primaryColor,
            fontWeight: FontWeight.w500, 
            fontSize: 35
           ),
        ),
        Text(
          "/", 
           style: TextStyle(
            //color: appColors.primaryColor,
            fontWeight: FontWeight.w500, 
            fontSize: 35
           ),
          ), 
        Text(
          c.result.toString(), 
           style: TextStyle(
          //  color: appColors.secondaryColor,
            fontWeight: FontWeight.w500, 
            fontSize: 35
           ),
        ),
      ],
    );
  }
}