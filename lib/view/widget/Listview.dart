import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:quizmopile/controller/QuistionPageController.dart';
import 'package:quizmopile/core/constant/app_color.dart';
import 'package:quizmopile/view/widget/choiceWidget.dart';

// ignore: must_be_immutable
class Listview extends StatelessWidget {
  Listview({super.key, required double w, required this.control}) : _w = w;

  final double _w;
  QuistionPageController control;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        padding: EdgeInsets.all(_w / 30),
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemCount:control.quistion[0]['questions'].length, //هون عدد الليستات يتحدد حسب عدد الاسئلة لكل سؤال ليست
        itemBuilder: (BuildContext c, int i) {
          //هون يتم بناء كل ليست لحال حسب الدليل تبعها
          return AnimationConfiguration.staggeredList(
              position: i,
              delay: const Duration(milliseconds: 100),
              child: SlideAnimation(
                duration: const Duration(milliseconds: 2500),
                curve: Curves.fastLinearToSlowEaseIn,
                horizontalOffset: 30,
                verticalOffset: 300.0,
                child: FlipAnimation(
                  duration: const Duration(milliseconds: 3000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  flipAxis: FlipAxis.y,
                  child: Container(
                    margin: EdgeInsets.only(bottom: _w / 20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: appColors.primaryColor, //هون غيرت لون الظل للبرتقالي
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                     '''${control.quistion[0]['questions'][i]['text']} :''', 
                                     style: Theme.of(context).textTheme.bodySmall,),
                                ), 

                              ],
                            ),
                            SizedBox(height: 8,) ,
                            choiceWidget(
                                i: i,
                                value: 'a',
                                choice: 0,
                                control: control),
                              SizedBox(height: 8,) , 
                            choiceWidget(
                                i: i,
                                value: 'b',
                                choice: 1,
                                control: control),
                            SizedBox(height: 8,) ,
                           control.quistion[0]['questions'][i]['choices'].length>=3? choiceWidget(
                                i: i,
                                value: 'c',
                                choice: 2,
                                control: control):SizedBox(height: 0.00001,),
                            SizedBox(height: 8,) ,
                           control.quistion[0]['questions'][i]['choices'].length==4? choiceWidget(
                                i: i,
                                value: 'd',
                                choice: 3,
                                control: control):SizedBox(height: 0.00001,),
                            SizedBox(height: 8,) ,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
