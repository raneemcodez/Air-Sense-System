import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airaystem/controller/onboarding_controller.dart';
import 'package:airaystem/data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<onBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemCount: onBoardingList.length,
      itemBuilder:
          (context, i) => Column(
            children: [
              Image.asset(onBoardingList[i].image!, width: 500),
              SizedBox(height: 10),
              Text(
                onBoardingList[i].title!,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 30),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  onBoardingList[i].body!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
    );
  }
}
