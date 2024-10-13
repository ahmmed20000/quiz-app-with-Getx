import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quizmopile/controller/auth/sign_up.dart';
import 'package:quizmopile/core/constant/app_color.dart';

class dropDownYear extends StatelessWidget {
  const dropDownYear({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child:GetBuilder<signUpController>(builder: (controller) => DropdownButton(
                    borderRadius: BorderRadius.circular(30),
                    
                      items: controller.years
                          .map((e) => DropdownMenuItem(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  "$e",
                                  style: const TextStyle(),
                                ),
                              ),
                              value: e))
                          .toList(),
                      value:controller.y,
                      hint: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "year",
                          style: TextStyle(),
                        ),
                      ),
                      onTap: () {
                        print(controller.y);
                      },
                      onChanged:(dynamic T){ controller.changeDropDownYear(T);}
                      ),
                ),) ;
  }
}