// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizmopile/view/auth/sign_up.dart';

// ignore: must_be_immutable
class createAccountRow extends StatelessWidget {
  void Function()? onTap;
  createAccountRow({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => signUp());
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Dont have an account? ".tr,
          ),
          Text(
            "Sign".tr,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            "Up".tr,
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}
