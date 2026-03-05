import 'package:airaystem/core/class/statuesrequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airaystem/core/constant/color.dart';
import 'package:airaystem/core/function/validinput.dart';
import 'package:airaystem/view/widget/auth/custombuttonauth.dart';
import 'package:airaystem/view/widget/auth/customtextformauth.dart';
import '../../../controller/auth/login_controller.dart';
import '../../../core/function/alertexitapp.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtexttitleauth.dart';
import '../../widget/auth/logoauth.dart';
import '../../widget/auth/customtextsignuporsignin.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backGroundColor,
        elevation: 0.0,
        title: Text(
          '4'.tr,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColor.green),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(
          builder:
              (controller) =>
                  controller.statusRequest == StatusRequest.loading
                      ? Center(child: Text("loading ...."))
                      : Container(
                        color: AppColor.backGroundColor,
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 30,
                        ),
                        child: Form(
                          key: controller.formstate,
                          child: ListView(
                            children: [
                              LogoAuth(),
                              SizedBox(height: 20),
                              CustomTextTitleAuth(text: '2'.tr),
                              SizedBox(height: 20),
                              CustomTextBodyAuth(text: '3'.tr),
                              SizedBox(height: 40),
                              Customtextformauth(
                                isNumber: false,
                                valid: (val) {
                                  return validInput(val!, 5, 100, "Email");
                                },
                                myController: controller.email,
                                hintText: '5'.tr,
                                labelText: '6'.tr,
                                iconData: Icons.email_outlined,
                                //  myController: null,
                              ),
                              GetBuilder<LoginControllerImp>(
                                builder:
                                    (controller) => Customtextformauth(
                                      obscurrText: controller.isShowPassword,
                                      onTapIcon: () {
                                        controller.showPassword();
                                      },
                                      isNumber: false,
                                      valid: (val) {
                                        return validInput(
                                          val!,
                                          5,
                                          30,
                                          "password",
                                        );
                                      },
                                      myController: controller.password,
                                      hintText: '7'.tr,
                                      labelText: '8'.tr,
                                      iconData: Icons.lock_outlined,
                                      //  myController: null,
                                    ),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.goToForgetPassword();
                                },
                                child: Text("9".tr, textAlign: TextAlign.end),
                              ),
                              CustomButtonAuth(
                                text: '10'.tr,
                                onPressed: () {
                                  controller.login();
                                },
                              ),
                              SizedBox(height: 30),
                              CustomTextSignUpOrSignIn(
                                textone: "11".tr,
                                texttwo: "12".tr,
                                onTap: () {
                                  controller.goToSignUp();
                                },
                                // ,
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
