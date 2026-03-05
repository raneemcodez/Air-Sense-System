import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airaystem/core/constant/routes.dart';
import 'package:airaystem/data/datasource/static/static.dart';

abstract class OnboardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class onBoardingControllerImp extends OnboardingController {
  late PageController pageController;
  int currentPage = 0;

  @override
  next() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      Get.offAllNamed(AppRoute.login);
    } else {
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
