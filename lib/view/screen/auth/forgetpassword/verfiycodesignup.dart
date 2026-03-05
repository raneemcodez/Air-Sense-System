import 'package:airaystem/core/class/statuesrequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:airaystem/core/constant/color.dart';
import '../../../../controller/auth/verfiycodesignup_controller.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class VerfiyCodeSignUp extends StatelessWidget {
  const VerfiyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backGroundColor,
        elevation: 0.0,
        title: Text(
          "28".tr,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColor.green),
        ),
      ),
      body: GetBuilder<VerifyCodeSignUpControllerImp>(
        builder:
            (controller) =>
                controller.statusRequest == StatusRequest.loading
                    ? Center(child: Text("Loading ..."))
                    : Container(
                      color: AppColor.backGroundColor,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 30,
                      ),
                      child: ListView(
                        children: [
                          SizedBox(height: 20),
                          CustomTextTitleAuth(text: "29".tr),
                          SizedBox(height: 20),
                          CustomTextBodyAuth(text: "30".tr),
                          SizedBox(height: 40),
                          OtpTextField(
                            borderRadius: BorderRadius.circular(10),
                            fieldWidth: 50.0,
                            numberOfFields: 5,
                            borderColor: Color(0xFF512DA8),
                            //set to true to show as box or false to show as dash
                            showFieldAsBox: true,
                            //runs when a code is typed in
                            onCodeChanged: (String code) {
                              //handle validation or checks here
                            },
                            //runs when every textfield is filled
                            onSubmit: (String verificationCode) {
                              controller.goToSuccessSignUp(verificationCode);
                            }, // end onSubmit
                          ),
                        ],
                      ),
                    ),
      ),
    );
  }
}
