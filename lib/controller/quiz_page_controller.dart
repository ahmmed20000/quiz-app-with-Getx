import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizmopile/core/class/git.dart';
import 'package:quizmopile/core/class/statusrequest.dart';
import 'package:quizmopile/core/constant/app_color.dart';
import 'package:quizmopile/core/functions/handlingdatacontroller.dart';
import 'package:quizmopile/data/dataSource/remote/teacher/get_question.dart';
import 'package:quizmopile/view/QuistionPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizPageControler extends GetxController {
  GlobalKey<FormState> formstatequiz = GlobalKey<FormState>();
  TextEditingController textUnm = TextEditingController();
  StatusRequest? statusRequest;
  late SharedPreferences share;
  Map<String, dynamic> q = {};
  getQuestion g = getQuestion(gitDataCore());
  getExam() async {
    var formdata22 = formstatequiz.currentState;
    if (formdata22!.validate()) {
      statusRequest = StatusRequest.loading;
      share = await SharedPreferences.getInstance();
      int? u = share.getInt("uni");
      share.setInt("quiz_id", int.parse(textUnm.text));
      var response = await g.postt(u!, int.parse(textUnm.text));
      statusRequest = handlingData(response);
      if(statusRequest == StatusRequest
              .serverfailure){
                Get.defaultDialog(
              backgroundColor: appColors.thirdColor,
              title: "",
              textCancel: "Ok".tr,
        content: Column(
          children: [
            Text(
              "لقد قدمت الاختبار مسبقا",
            ),
          ],
        ),
              buttonColor: appColors.primaryColor,
              confirmTextColor: appColors.secondColor,
              cancelTextColor: appColors.secondColor,
            );
              }
      print(" ${response['data']['questions'][0]}");
      q = response['data']['questions'][0];

      print("uni in quizPage is ${q.runtimeType}");
      Get.to(() => QuistionPage(), arguments: q);
    }
  }
}
