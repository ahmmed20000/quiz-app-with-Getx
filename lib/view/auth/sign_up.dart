import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizmopile/controller/auth/sign_up.dart';
import 'package:quizmopile/core/constant/app_color.dart';
import 'package:quizmopile/core/functions/validinput.dart';
import 'package:quizmopile/core/language/local.dart';
import 'package:quizmopile/core/responcive/uiComponent/infoWidget.dart';
import 'package:quizmopile/core/shared/app_big_sizedbox.dart';
import 'package:quizmopile/core/shared/app_button.dart';
import 'package:quizmopile/core/shared/app_image.dart';
import 'package:quizmopile/core/shared/app_sizedbox.dart';
import 'package:quizmopile/core/shared/app_smallsized.dart';
import 'package:quizmopile/core/shared/app_textformfiled.dart';

import 'package:quizmopile/view/auth/login_page.dart';
import 'package:quizmopile/view/widget/auth/drop_down_year.dart';

class signUp extends StatelessWidget {
  const signUp({super.key});

  @override
  Widget build(BuildContext context) {
    signUpController contoller = Get.put(signUpController());
    return infoWidget(
        builder: (context, diviceinfo) => Form(
              key: contoller.formstateSignUp,
              child: SafeArea(
                  child: Scaffold(
                backgroundColor: appColors.bgScaffoldColor,
                body: SingleChildScrollView(
                  child: Column(children: [
                    appImage(
                      path: "111.jpg",
                      hasFit: false,
                      customHeight: diviceinfo.localHeight * 0.2,
                      cutomWidth: diviceinfo.localWidth,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign".tr,
                          style: TextStyle(
                              fontSize: diviceinfo.localWidth * 0.07,
                              fontWeight: FontWeight.w500,
                              color: appColors.primaryColor),
                        ),
                        Text(
                          "Up".tr,
                          style: TextStyle(
                              fontSize: diviceinfo.localWidth * 0.07,
                              fontWeight: FontWeight.w500,
                              color: appColors.secondaryColor),
                        ),
                      ],
                    ),
                    appMeduimSizedBox(
                        //height: diviceInfo.localHeight
                        ),
                    // dropDownYear(),
                    // appSmallSizedBox(),
                    appTextFF(
                      control: contoller.name,
                      valid: (val) {
                        return validInput(val!, 3, 100, "name", 10);
                      },
                      hint: "Enter your name",
                      label: "your name",
                      icon: const Icon(Icons.person),
                      // height: diviceInfo.localHeight,
                      // width: diviceInfo.localWidth,
                    ),
                    // appTextFF(
                    //   control: contoller.email,
                    //   valid: (val) {
                    //     return validInput(val!, 3, 100, "last", 10);
                    //   },
                    //   hint: "Enter last name",
                    //   label: "last name",
                    //   icon: const Icon(Icons.family_restroom),
                    //   // height: diviceInfo.localHeight,
                    //   // width: diviceInfo.localWidth,
                    // ),
                    // appTextFF(
                    //   control: contoller.email,
                    //   isJustNumber: true,
                    //   valid: (val) {
                    //     return validInput(val!, 2, 100, "number", 10);
                    //   },
                    //   hint: "Enter collage number",
                    //   label: "collage number",
                    //   icon: const Icon(Icons.format_list_numbered_rounded),
                    //   // height: diviceInfo.localHeight,
                    //   // width: diviceInfo.localWidth,
                    // ),
                    appTextFF(
                      control: contoller.email,
                      valid: (val) {
                        return validInput(val!, 5, 100, "email", 10);
                      },
                      hint: "Enter Your Email",
                      label: "Email",
                      icon: const Icon(Icons.email_outlined),
                      // height: diviceInfo.localHeight,
                      // width: diviceInfo.localWidth,
                    ),
                    GetBuilder<signUpController>(
                      builder: (controller) => appTextFF(
                        control: controller.password,
                        obscure: controller.isShowPassword,
                        onTapIcon: () {
                          controller.showPassword();
                        },
                        valid: (val) {
                          return validInput(val!, 4, 30, "password", 10);
                        },
                        hint: "Enter Your Password",
                        label: "Password",
                        icon: Icon(
                          controller.isShowPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                    GetBuilder<signUpController>(
                      builder: (controller) => appTextFF(
                        control: controller.confirm,
                        obscure: controller.isShowPassword,
                        onTapIcon: () {
                          controller.showPassword();
                        },
                        valid: (val) {
                          return validInput(val!, 4, 30, "password", 10);
                        },
                        hint: "Enter confirm Password",
                        label: "confirm Password",
                        icon: Icon(
                          controller.isShowPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                    appButton(
                        content: "SignUp",
                        screenWidth: diviceinfo.localWidth * 0.3,
                        // screenHeight: diviceInfo.localHeight,
                        onTap: ()async {
                          contoller.signUp();
                        }),
                  ]),
                ),
              )),
            ));
  }
}
