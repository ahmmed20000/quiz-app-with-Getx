import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quizmopile/binding/studentBindings/resultPageBindings.dart';
import 'package:quizmopile/core/class/curd.dart';
import 'package:quizmopile/core/class/statusrequest.dart';
import 'package:quizmopile/core/constant/app_color.dart';
import 'package:quizmopile/core/functions/handlingdatacontroller.dart';
import 'package:quizmopile/data/dataSource/remote/teacher/get_result.dart';
import 'package:quizmopile/view/quiz_page.dart';
import 'package:quizmopile/view/resultPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuistionPageController extends GetxController {
  late List<String> val;

  int c = 0; // هون تسند قيمة الوقت الي حطها الاستاذ ناقص واحد
  int s = 59; //هون الثواني
  int time = 0;
  late Timer t; // هون المؤقت
  late int times;
  late List<Map<String, dynamic>> quistion = [{}];
  List<Map<String, dynamic>> answer = [{}];
  StatusRequest? statusRequest;
  getResult getrruslt = getResult(Crud());
  late SharedPreferences share;

  late List<Map<String, dynamic>> quiz = [
    {
      "quize_id": 1,
      "mark": 10.obs,
      "text": "What is the capital of Syria?",
      "choices": [
        {"choice": "Almyaden", "is_true": true},
        {"choice": "Homs", "is_true": false},
        {"choice": "Der Ez Zour", "is_true": false},
        {"choice": "Aleppo", "is_true": false}
      ]
    },
    {
      "quize_id": 1,
      "mark": 5.obs,
      "text": "What is the capital of France?",
      "choices": [
        {"choice": "Paris", "is_true": true},
        {"choice": "London", "is_true": false},
        {"choice": "Berlin", "is_true": false}
      ]
    },
    {
      "quize_id": 1,
      "mark": 3.obs,
      "text": "1+1=0 ?",
      "choices": [
        {"choice": "true", "is_true": true},
        {"choice": "false", "is_true": false},
      ]
    }
  ];
  int result = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // quiz = Get.arguments[0];
    // time = Get.arguments[1];
    var q = Get.arguments;
    print("q in question page is $q");
    quistion[0].addAll(q);
    val = List<String>.filled(quistion[0]['questions'].length, "");
    print("question in question page is $quistion");
    time = int.parse(quistion[0]['duration'].toString());
    quistion[0]['questions'].shuffle();
    /*quistion[0]['questions'].forEach((quistion) {
      quistion.shuffle();
    });*/
    print("timeee is : $time");
    c = time - 1; //اسند الوقت ناقص واح لان الثواني تساوي 60
    t = Timer.periodic(Duration(seconds: 1), (timer) async {
      s--;
      update();
      if (s == 0) {
        if (c == 0 && s == 0) {
          // print("ddddddd");
          for (int i = 0; i < quistion[0]['questions'].length; i++) {
            if (val[i] == "a") {
              answer.add({
                "question_id": quistion[0]['questions'][i]['id'],
                "choice_id": quistion[0]['questions'][i]['choices'][0]['id']
              });
            }
            if (val[i] == "b") {
              answer.add({
                "question_id": quistion[0]['questions'][i]['id'],
                "choice_id": quistion[0]['questions'][i]['choices'][1]['id']
              });
            }
            if (val[i] == "c") {
              answer.add({
                "question_id": quistion[0]['questions'][i]['id'],
                "choice_id": quistion[0]['questions'][i]['choices'][2]['id']
              });
            }
            if (val[i] == "d") {
              answer.add({
                "question_id": quistion[0]['questions'][i]['id'],
                "choice_id": quistion[0]['questions'][i]['choices'][3]['id']
              });
            }
          }
          answer.removeAt(0);
          print("answer is $answer");
          statusRequest = StatusRequest.loading;
          print("in question page before response ");
          share = await SharedPreferences.getInstance();
          int? n = share.getInt("uni");
          print("uni is $n");
          int? quiz_id = await share.getInt("quiz_id");
          print("in ques page quiz id is ${quiz_id}");
          List<Map<String, dynamic>> ttttt = [
            {"question_id": 9, "choice_id": 34},
            {"question_id": 10, "choice_id": 38}
          ];
          var response = await getrruslt.postData(n!, quiz_id!, answer);
          print("========================Controller $response");
          statusRequest = handlingData(response);
          print("in ques page statues request is $statusRequest");
          if (StatusRequest.success == statusRequest) {
            int himMark = response['data'];
            result = quistion[0]['mark'];
            t.cancel();
            Get.offAll(() => resultPage(),
                binding: resultPageBindings(), arguments: [himMark, result]);
          } else {
            Get.defaultDialog(
              backgroundColor: appColors.thirdColor,
              title: "",
              textCancel: "Ok".tr,
             onCancel: () {
          Get.off(() => quizPage());
        },
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
            print("$statusRequest");
          }

          t.cancel(); // هون ينتهي الوقت وتقدر تعمل الي بدك ياه
        }
        s = 59;
        c--;
        update();
      }
    });
  }

  void radioChange(int i, v) {
    val[i] = v.toString();
    print(val[i]);
    update();
  }

  void term(mark) {
    Get.offAll(() => resultPage(),
        binding: resultPageBindings(), arguments: [mark, result]);
  }

  void onSend() async {
    for (int i = 0; i < quistion[0]['questions'].length; i++) {
      if (val[i] == "a") {
        // String mark = quiz[i]['mark'].toString();
        // // print(mark);
        // result += int.parse(mark); //نتيجة الطالب
        print("the id is${quistion[0]['questions'][i]['id']} ");
        print(
            "the choice is${quistion[0]['questions'][i]['choices'][0]['id']} ");
        answer.add({
          "question_id": quistion[0]['questions'][i]['id'],
          "choice_id": quistion[0]['questions'][i]['choices'][0]['id']
        });
      }
      if (val[i] == "b") {
        // String mark = quiz[i]['mark'].toString();
        // // print(mark);
        // result += int.parse(mark); //نتيجة الطالب
        print("the id is${quistion[0]['questions'][i]['id']} ");
        print(
            "the choice is${quistion[0]['questions'][i]['choices'][1]['id']} ");
        answer.add({
          "question_id": quistion[0]['questions'][i]['id'],
          "choice_id": quistion[0]['questions'][i]['choices'][1]['id']
        });
      }
      if (val[i] == "c") {
        // String mark = quiz[i]['mark'].toString();
        // // print(mark);
        // result += int.parse(mark); //نتيجة الطالب
        print("the id is${quistion[0]['questions'][i]['id']} ");
        print(
            "the choice is${quistion[0]['questions'][i]['choices'][2]['id']} ");
        answer.add({
          "question_id": quistion[0]['questions'][i]['id'],
          "choice_id": quistion[0]['questions'][i]['choices'][2]['id']
        });
      }
      if (val[i] == "d") {
        // String mark = quiz[i]['mark'].toString();
        // // print(mark);
        // result += int.parse(mark); //نتيجة الطالب
        print("the id is${quistion[0]['questions'][i]['id']} ");
        print(
            "the choice is${quistion[0]['questions'][i]['choices'][3]['id']} ");
        answer.add({
          "question_id": quistion[0]['questions'][i]['id'],
          "choice_id": quistion[0]['questions'][i]['choices'][3]['id']
        });
      }
      // int mark = 0;
      /*for (int i = 0; i < quiz.length; i++) {
        String mar = quiz[i]['mark'].toString();
        // print(mark);
        mark += int.parse(mar); //العلامة الكلية
      }*/
      // print(mark);
    }
    answer.removeAt(0);
    print("answer is $answer");
    statusRequest = StatusRequest.loading;
    print("in question page before response ");
    share = await SharedPreferences.getInstance();
    int? n = share.getInt("uni");
    print("uni is $n");
    int? quiz_id = await share.getInt("quiz_id");
    print("in ques page quiz id is ${quiz_id}");
    List<Map<String, dynamic>> ttttt = [
      {"question_id": 9, "choice_id": 34},
      {"question_id": 10, "choice_id": 38}
    ];
    var response = await getrruslt.postData(n!, quiz_id!, answer);
    print("========================Controller $response");
    statusRequest = handlingData(response);
    print("in ques page statues request is $statusRequest");
    if (StatusRequest.success == statusRequest) {
      int himMark = response['data'];
      result = quistion[0]['mark'];
      t.cancel();
      Get.offAll(() => resultPage(),
          binding: resultPageBindings(), arguments: [himMark, result]);
    } else {
      Get.defaultDialog(
        backgroundColor: appColors.thirdColor,
        title: "",
        textCancel: "Ok".tr,
        onCancel: () {
          Get.off(() => quizPage());
        },
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
      print("$statusRequest");
    }
  }
}
