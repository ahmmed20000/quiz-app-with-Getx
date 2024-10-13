// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizmopile/controller/resultPageController.dart';
import 'package:quizmopile/core/constant/app_color.dart';
import 'package:quizmopile/core/shared/app_button.dart';
import 'package:quizmopile/core/shared/app_image.dart';
import 'package:quizmopile/core/shared/app_smallsized.dart';
import 'package:quizmopile/view/quiz_page.dart';
import 'package:quizmopile/view/widget/resultButton.dart';
import 'package:quizmopile/view/widget/resultTitle.dart';
import 'package:quizmopile/view/widget/result_mark.dart';

class resultPage extends StatelessWidget {
  resultPage({super.key});
  resultPageController c = Get.put(resultPageController());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: appColors.bgScaffoldColor,
        body: Column(
          children: [
            appSmallSizedBox(),
            appSmallSizedBox(),
            appImage(path: "5.webp", hasFit: false),

            appSmallSizedBox(),
            appSmallSizedBox(),
            resultTitle(),

            result_mark(c: c),

            appSmallSizedBox(),
            appSmallSizedBox(),
            appButton(
              
              content: "Go to homePage",
              
              onTap: () {
                Get.offAll(() => quizPage());
              },
              screenWidth: width * 0.4,
            )
            // resultButton(screenWidth: width, screenHieght: height),
          ],
        ),
      ),
    );
  }
}
