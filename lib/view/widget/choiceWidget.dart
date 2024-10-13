import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:quizmopile/controller/QuistionPageController.dart';


// ignore: must_be_immutable
class choiceWidget extends StatelessWidget {
  choiceWidget(
      {super.key,
      required this.i,
      required this.value,
      required this.choice, 
      required this.control
      
      });
  int i;
  String value;
  int choice;
  QuistionPageController control;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GetBuilder<QuistionPageController>(
            builder: (control) => Radio(
                value: value,
                groupValue: control.val[i],
                onChanged: (v) {
                  control.radioChange(i, v);
                })
                ),
        Expanded(
          child: Text(
           '''${control.quistion[0]['questions'][i]['choices'][choice]['choice']}''' , 
           
            ),
        ),
       // text(content: Quistion, hasCustomColor: false, hasCustomfontSize: false)
      ],
    );
  }
}
