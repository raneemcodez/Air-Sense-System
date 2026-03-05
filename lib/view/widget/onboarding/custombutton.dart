import 'package:airaystem/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airaystem/controller/onboarding_controller.dart';

class CustomButtonOnBoarding extends GetView<onBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 80),
      height: 40,
      color: AppColor.green,
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 0),
        textColor: AppColor.backGroundColor,
        onPressed: () {
          controller.next();
        },
        child: Text("46".tr),
      ),
    );
  }
}
