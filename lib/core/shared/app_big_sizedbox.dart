import 'package:flutter/material.dart';
import 'package:quizmopile/core/responcive/uiComponent/infoWidget.dart';

// ignore: must_be_immutable
class appBigSizedBox extends StatelessWidget {
  double? cutomHeight;
  appBigSizedBox({
    super.key,
    this.cutomHeight
  });

  @override
  Widget build(BuildContext context) {
    return infoWidget(
        builder: (context, diviceInfo) => SizedBox(
              height:cutomHeight?? diviceInfo.screenHeight * 0.34,
            ));
  }
}
