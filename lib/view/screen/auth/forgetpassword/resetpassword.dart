import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airaystem/core/constant/color.dart';
import 'package:airaystem/view/widget/auth/custombuttonauth.dart';
import '../../../../controller/forgetpassword/resetpassword_controller.dart';
import '../../../../core/function/validinput.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller = Get.put(
      ResetPasswordControllerImp(),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backGroundColor,
        elevation: 0.0,
        title: Text(
          "34".tr,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColor.green),
        ),
      ),
      body: Container(
        color: AppColor.backGroundColor,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: controller.formstate, // <-- اضفت الفورم وربطتها بالكنترولر
          child: ListView(
            children: [
              SizedBox(height: 20),
              CustomTextTitleAuth(text: "35".tr),
              SizedBox(height: 20),
              CustomTextBodyAuth(text: "36".tr),
              SizedBox(height: 40),
              Customtextformauth(
                isNumber: false,
                valid: (val) {
                  return validInput(val!, 3, 40, "8".tr);
                },
                myController: controller.password,
                hintText: "7".tr,
                labelText: "37".tr,
                iconData: Icons.lock_outlined,
              ),
              Customtextformauth(
                isNumber: false,
                valid: (val) {
                  return validInput(val!, 3, 40, "8".tr);
                },
                myController: controller.repassword,
                hintText: "39".tr,
                labelText: "37".tr,
                iconData: Icons.lock_outlined,
              ),
              CustomButtonAuth(
                text: "39".tr,
                onPressed: () {
                  controller.goToSuccessResetPassword();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
