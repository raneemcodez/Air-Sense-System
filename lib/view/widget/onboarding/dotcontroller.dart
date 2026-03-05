import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airaystem/controller/onboarding_controller.dart';
import 'package:airaystem/core/constant/color.dart';
import 'package:airaystem/data/datasource/static/static.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<onBoardingControllerImp>(
      builder:
          (controller) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                onBoardingList.length,
                (index) => AnimatedContainer(
                  margin: const EdgeInsets.only(right: 4, bottom: 50),
                  duration: const Duration(milliseconds: 900),
                  width: controller.currentPage == index ? 20 : 5,
                  height: 6,
                  decoration: BoxDecoration(
                    color: AppColor.green,
                    borderRadius: BorderRadius.circular(19),
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
