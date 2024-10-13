import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizmopile/controller/quiz_page_controller.dart';
import 'package:quizmopile/core/constant/app_color.dart';
import 'package:quizmopile/core/functions/validinput.dart';
import 'package:quizmopile/core/responcive/uiComponent/infoWidget.dart';
import 'package:quizmopile/core/shared/app_big_sizedbox.dart';
import 'package:quizmopile/core/shared/app_button.dart';
import 'package:quizmopile/core/shared/app_image.dart';
import 'package:quizmopile/core/shared/app_sizedbox.dart';
import 'package:quizmopile/core/shared/app_smallsized.dart';
import 'package:quizmopile/core/shared/app_textformfiled.dart';

class quizPage extends StatelessWidget {
  const quizPage({super.key});

  @override
  Widget build(BuildContext context) {
    QuizPageControler controller = Get.put(QuizPageControler());
    return infoWidget(
        builder: (context, diviceInfo) => Form(
            key: controller.formstatequiz,
            child: SafeArea(
                child: Scaffold(
              backgroundColor: appColors.bgScaffoldColor,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    appMeduimSizedBox(),
                    appImage(path: "2.jpg", hasFit: false),
                    appBigSizedBox(
                      cutomHeight: diviceInfo.screenHeight * 0.1,
                    ),
                    appTextFF(
                      control: controller.textUnm,
                      valid: (val) {
                        return validInput(val!, 1, 100, "numberr", 10);
                      },
                      hint: "Enter test number",
                      label: "test number",
                      icon: const Icon(Icons.thirty_fps_select_sharp),
                    ),
                    appButton(
                        content: "show Quiz",
                        screenWidth: diviceInfo.localWidth * 0.4,
                        onTap: () {
                          controller.getExam();
                        })
                  ],
                ),
              ),
            ))));
  }
}
