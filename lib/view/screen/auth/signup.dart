import 'package:airaystem/core/class/statuesrequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airaystem/core/constant/color.dart';
import 'package:airaystem/core/function/validinput.dart';
import '../../../controller/auth/signup_controller.dart';
import '../../../core/function/alertexitapp.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitleauth.dart';
import '../../widget/auth/customtextsignuporsignin.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backGroundColor,
        elevation: 0.0,
        title: Text(
          '12'.tr,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColor.green),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<SignUpControllerImp>(
          builder:
              (controller) =>
                  controller.statusRequest == StatusRequest.loading
                      ? Center(child: Text("loading ...."))
                      : Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 30,
                        ),
                        child: Form(
                          key: controller.formstate,
                          child: ListView(
                            children: [
                              const SizedBox(height: 25),
                              CustomTextTitleAuth(text: "19".tr),
                              const SizedBox(height: 25),
                              CustomTextBodyAuth(text: "13".tr),
                              const SizedBox(height: 50),
                              Customtextformauth(
                                isNumber: false,
                                valid: (val) {
                                  return validInput(val!, 3, 20, "username");
                                },
                                myController: controller.username,
                                hintText: "15".tr,
                                iconData: Icons.person_outline,
                                labelText: "16".tr,
                                // mycontroller: ,
                              ),
                              Customtextformauth(
                                isNumber: false,
                                valid: (val) {
                                  return validInput(val!, 3, 40, "email");
                                },
                                myController: controller.email,
                                hintText: "5".tr,
                                iconData: Icons.email_outlined,
                                labelText: "6".tr,
                                // mycontroller: ,
                              ),
                              Customtextformauth(
                                isNumber: true,
                                valid: (val) {
                                  return validInput(val!, 7, 11, "phone");
                                },
                                myController: controller.phone,
                                hintText: "14".tr,
                                iconData: Icons.phone_android_outlined,
                                labelText: "17".tr,
                                // mycontroller: ,
                              ),
                              Customtextformauth(
                                isNumber: false,
                                valid: (val) {
                                  return validInput(val!, 3, 30, "password");
                                },
                                myController: controller.password,
                                hintText: "7".tr,
                                iconData: Icons.lock_outline,
                                labelText: "8".tr,
                                // mycontroller: ,
                              ),
                              CustomButtonAuth(
                                text: "10".tr,
                                onPressed: () {
                                  controller.signUp();
                                },
                              ),
                              const SizedBox(height: 40),
                              CustomTextSignUpOrSignIn(
                                textone: "18".tr,
                                texttwo: "4".tr,
                                onTap: () {
                                  controller.goToSignIn();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
        ),
      ),
    );
  }
}
