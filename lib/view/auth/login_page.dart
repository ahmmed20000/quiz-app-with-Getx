import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quizmopile/controller/auth/login_controller.dart';
import 'package:quizmopile/core/constant/app_color.dart';
import 'package:quizmopile/core/functions/validinput.dart';
import 'package:quizmopile/core/language/localController.dart';
import 'package:quizmopile/core/responcive/uiComponent/infoWidget.dart';
import 'package:quizmopile/core/shared/app_big_sizedbox.dart';
import 'package:quizmopile/core/shared/app_button.dart';
import 'package:quizmopile/core/shared/app_image.dart';
import 'package:quizmopile/core/shared/app_sizedbox.dart';
import 'package:quizmopile/core/shared/app_smallsized.dart';
import 'package:quizmopile/core/shared/app_textformfiled.dart';
import 'package:quizmopile/view/widget/auth/create_acoount_row.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    localController c = Get.find();
    loginController controller = Get.put(loginController());

    return infoWidget(
        builder: (context, diviceInfo) => Form(
              key: controller.formstate,
              child: SafeArea(
                child: Scaffold(
                  backgroundColor: appColors.bgScaffoldColor,
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(appColors.raduce),
                                  topRight: Radius.circular(appColors.raduce)
                                ),
                              ),
                              child: Column(
                                children: [
                                  appBigSizedBox(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Journ".tr,
                                        style: TextStyle(
                                            fontSize:
                                                diviceInfo.localWidth * 0.09,
                                            fontWeight: FontWeight.w500,
                                            color: appColors.primaryColor),
                                      ),
                                      Text(
                                        "eys".tr,
                                        style: TextStyle(
                                            fontSize:
                                                diviceInfo.localWidth * 0.09,
                                            fontWeight: FontWeight.w500,
                                            color: appColors.secondaryColor),
                                      ),
                                    ],
                                  ),
                                  appMeduimSizedBox(),
                                  appTextFF(
                                    control: controller.textUser,
                                    valid: (val) {
                                      return validInput(
                                          val!, 5, 100, "name", 10);
                                    },
                                    hint: "Enter Your Email",
                                    label: "Email",
                                    icon: const Icon(Icons.email_outlined),
                                  ),
                                  appSmallSizedBox(),
                                  GetBuilder<loginController>(
                                    builder: (controller) => appTextFF(
                                      control: controller.textPass,
                                      obscure: controller.isShowPassword,
                                      onTapIcon: () {
                                        controller.showPassword();
                                      },
                                      valid: (val) {
                                        return validInput(
                                            val!, 4, 30, "password", 10);
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
                                  appSmallSizedBox(),
                                  appButton(
                                    content: "Login",
                                    onTap: () {
                                      controller.showQuiz();
                                    },
                                    screenWidth: diviceInfo.localWidth * 0.4,
                                  ),
                                  appMeduimSizedBox(),
                                  createAccountRow(
                                   
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                                top: 0,
                                right: 0,
                                child: appImage(
                                  path: "t1.jpg",
                                  hasFit: false,
                                  customHeight: screenSize.height * 0.3,
                                  cutomWidth: screenSize.width,
                                )),
                            Positioned(
                                top: 0,
                                right: 0,
                                child: appImage(
                                  path: "1.png",
                                  CutomColor: appColors.primaryColor,
                                  cutomWidth: screenSize.width * 0.2,
                                  hasFit: false,
                                )),
                            Positioned(
                              top: 0,
                              left: 0,
                              child: Image.asset("assets/images/main_top.png",
                                  width: screenSize.width * 0.2,
                                  color: appColors.secondaryColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
