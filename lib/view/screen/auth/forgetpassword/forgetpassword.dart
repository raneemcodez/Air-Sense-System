import 'package:airaystem/core/class/statuesrequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airaystem/core/constant/color.dart';
import 'package:airaystem/view/widget/auth/custombuttonauth.dart';
import 'package:airaystem/view/widget/auth/customtextformauth.dart';
import '../../../../controller/forgetpassword/forgetpassword_controller.dart';
import '../../../../core/function/validinput.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backGroundColor,
        elevation: 0.0,
        title: Text(
          "24".tr,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColor.green),
        ),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder:
            (controller) =>
                controller.statusRequest == StatusRequest.loading
                    ? Center(child: Text("Loading .."))
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
                            SizedBox(height: 20),
                            CustomTextTitleAuth(text: "25".tr),
                            SizedBox(height: 20),
                            CustomTextBodyAuth(text: "26".tr),
                            SizedBox(height: 40),
                            Customtextformauth(
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 5, 100, "6".tr);
                              },
                              myController: controller.email,
                              hintText: '5'.tr,
                              labelText: '6'.tr,
                              iconData: Icons.email_outlined,
                            ),
                            CustomButtonAuth(
                              text: "27".tr,
                              onPressed: () {
                                controller.checkemail();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
      ),
    );
  }
}
