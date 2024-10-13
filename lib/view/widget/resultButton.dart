import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizmopile/core/constant/app_color.dart';

// ignore: must_be_immutable
class resultButton extends StatelessWidget {
  resultButton({
    super.key,
    required this.screenWidth,
    required this.screenHieght,
  });

  final double screenWidth;
  final double screenHieght;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: screenWidth / 2,
        height: screenHieght / 15,
        decoration: BoxDecoration(
            color: appColors.primaryColor,
            borderRadius: BorderRadius.circular(appColors.raduce)),
        child: Center(
            child: Text(
          "Go to homePage",
          style: TextStyle(
              //color: appColors.primaryColor,
              fontWeight: FontWeight.w500,
              fontSize: screenWidth * 0.04),
        )),
      ),
    );
  }
}
