import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizmopile/core/class/crud_auth.dart';
import 'package:quizmopile/core/class/statusrequest.dart';
import 'package:quizmopile/core/functions/handlingdatacontroller.dart';
import 'package:quizmopile/data/dataSource/remote/auth/signup.dart';

class signUpController extends GetxController {
  GlobalKey<FormState> formstateSignUp = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm = TextEditingController();
  List<String> years = ["1", "2", "3", "4", "5"];
  var y;
  bool isShowPassword = true;

    StatusRequest? statusRequest; //يعني تقبل ال null
  SignupData signupData = SignupData(CrudAuth());

  void changeDropDownYear(dynamic T) {
    y = T;
    update();
  }

  showPassword() {
    isShowPassword = !isShowPassword;
    //print("heloo");
    update();
  }
 signUp() async {
    var formdata = formstateSignUp.currentState;
    if (formdata!.validate()) {
      if (password.text == confirm.text) {
        statusRequest = StatusRequest.loading;
        print(name.text);
        var response = await signupData.postData(
            name.text, email.text, password.text, confirm.text);
        print("========================Controller $response");
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
       print("in sign up controller response is sucess");
        //  data.addAll(response['data']);
           Get.back();

        }

        update();

        //كل هالحكي مشان يتحقق اذا الحقول صالحة او لا
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "password is not the same".tr);
      }
    } else {}
  }

}
