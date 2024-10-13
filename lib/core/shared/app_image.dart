import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizmopile/core/responcive/uiComponent/infoWidget.dart';

// ignore: must_be_immutable
class appImage extends StatelessWidget {
  String path;
   Color? CutomColor;
  appImage({super.key, required this.path, this.customHeight, this.cutomWidth , required this.hasFit, this.CutomColor});
  double? cutomWidth;
  double? customHeight;
  bool hasFit;
  @override
  Widget build(BuildContext context) {
    return infoWidget(
        builder: (context, diviceInfo) => Image.asset(
      "assets/images/$path",
      width:cutomWidth,
      height:customHeight,
      fit: hasFit? BoxFit.fill:null,
      color:CutomColor ,
    ))
    ;
  }
}