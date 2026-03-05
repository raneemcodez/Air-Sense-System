import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airaystem/controller/auth/successsignup_controller.dart';

import '../../../core/constant/color.dart';
import '../../widget/auth/custombuttonauth.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller = Get.put(
      SuccessSignUpControllerImp(),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backGroundColor,
        elevation: 0.0,
        title: Text(
          "31".tr,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColor.green),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppColor.green,
              ),
            ),
            Text("32".tr, style: Theme.of(context).textTheme.headlineLarge),
            // Text("Successfully registered"),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButtonAuth(
                text: "33".tr,
                onPressed: () {
                  controller.goToPageLogin();
                },
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
