import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airaystem/controller/onboarding_controller.dart';
import 'package:airaystem/core/constant/color.dart';
import 'package:airaystem/view/widget/onboarding/custombutton.dart';
import 'package:airaystem/view/widget/onboarding/customslider.dart';
import 'package:airaystem/view/widget/onboarding/dotcontroller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(onBoardingControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 4, child: CustomSliderOnBoarding()),
            Expanded(
              flex: 0,
              child: Column(
                children: [
                  const CustomDotControllerOnBoarding(),
                  // const Spacer(flex: 2),
                  const CustomButtonOnBoarding(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
