// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizmopile/controller/QuistionPageController.dart';
import 'package:quizmopile/core/constant/app_color.dart';
import 'package:quizmopile/view/widget/Listview.dart';

// ignore: must_be_immutable
class QuistionPage extends StatelessWidget {
  QuistionPage({super.key});
  QuistionPageController control = Get.put(QuistionPageController());

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: GetBuilder<QuistionPageController>(
            builder: (contr) => FloatingActionButton(
                  backgroundColor: appColors.secondaryColor,
                  splashColor: appColors.primaryColor,
                  onPressed: () {},
                  child: control.c >= 0
                      ? Center(
                          child: Text(
                            control.c.toString().padLeft(2, "0") +
                                ":" +
                                control.s.toString().padLeft(2, "0"),
                          ),
                        )
                      : Text(
                          "",
                        ),
                )),
        appBar: AppBar(
          backgroundColor: appColors.primaryColor,
          centerTitle: true,
          title: Text(
            "Your Quiz",
          ),
          actions: [
            /* IconButton(
                onPressed: () {
                  control.onSend();
                },
                icon: Icon(
                  Icons.send,
                  color: appColors.secondaryColor,
                ))*/
          ],
        ),
        backgroundColor: appColors.bgScaffoldColor,
        body: Listview(
          w: _w,
          control: control,
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          decoration: BoxDecoration(
            color: appColors.secondaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.send,
                  color: appColors.primaryColor,
                ),
                onPressed: () {
                  // Perform send action here
                  print('Send button tapped');
                  control.onSend();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
