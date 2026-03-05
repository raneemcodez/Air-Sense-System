import 'package:airaystem/core/constant/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airaystem/core/constant/color.dart';
import 'package:airaystem/core/constant/routes.dart';
import 'package:airaystem/core/localization/changelocal.dart';
import 'package:airaystem/view/widget/language/custombuttonlang.dart';

class Language extends GetView<LocalController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImageAsset.langPagePhoto),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Text(
                '1'.tr,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButtonLang(
                    textbutton: "Arabic",
                    buttonColor: AppColor.green,
                    onPressed: () {
                      controller.changeLang("ar");
                      Get.toNamed(AppRoute.onboarding);
                    },
                  ),
                  CustomButtonLang(
                    textbutton: "English",
                    buttonColor: AppColor.green,
                    onPressed: () {
                      controller.changeLang("en");
                      Get.toNamed(AppRoute.onboarding);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
