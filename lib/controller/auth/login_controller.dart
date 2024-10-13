import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizmopile/binding/studentBindings/QuistionPageBindings.dart';
import 'package:quizmopile/core/class/crud_auth.dart';
import 'package:quizmopile/core/class/statusrequest.dart';
import 'package:quizmopile/core/functions/handlingdatacontroller.dart';
import 'package:quizmopile/data/dataSource/remote/auth/login.dart';
import 'package:quizmopile/view/QuistionPage.dart';
import 'package:quizmopile/view/quiz_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginController extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController textUser = TextEditingController();
  TextEditingController textPass = TextEditingController();
  bool isShowPassword = true;
  StatusRequest? statusRequest;
  final List<Map<String, dynamic>> quistion = [
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
  LoginData loginData = LoginData(CrudAuth());
  late SharedPreferences share;
  showPassword() {
    isShowPassword = !isShowPassword;
    //print("heloo");
    update();
  }

  showQuiz() async {
    /* Get.off(
      QuistionPage(), 
      binding: QuistionPageBindings(),
      arguments: [3]);*/
    var formdata = formstate.currentState;
    print(textUser.text);
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      print("in login besfore response ");

      var response = await loginData.postData(textUser.text, textPass.text);
      print("========================Controller $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        // print(response['status']);
        // if(response['status']=="success"){
        //print("sucessssss");
        share = await SharedPreferences.getInstance();
        print("share in login deacleare");
        share.setString("token", response["data"]['token']);
        share.setInt("user_id", response["data"]['user_id']);
        print("brfore store uni_num");
        share.setInt("uni", response["data"]["student info"]["uni_num"]);

        print("sucess in login controller");
        print("uni num isssssssssssssssssssssssssssss ${share.getInt("uni")}");
        // await CacheHelper.saveData(
        //     key: 'token', value: response["data"]['token']);
        // await CacheHelper.saveData(
        //     key: 'user_id', value: response["data"]['user_id']);
        // List responseData= [response["data"]['token'], response['data']['user_id']];
        //print("in login controller in if sucess the responseData is ${responseData}");
        //data.addAll(response['data']);
        Get.to(() => quizPage());
        print("vvvvvvvv");

        // }
        /* else{
        //print("cccc");
        Get.defaultDialog(title:"Warning",middleText: "Email or password not correct");
        statusRequest=StatusRequest.failure;
      }*/
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "Email or password not correct");
      }

      update();
    } else {}
  }
}
