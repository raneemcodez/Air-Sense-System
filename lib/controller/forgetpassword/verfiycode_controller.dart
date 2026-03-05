import 'package:airaystem/core/class/statuesrequest.dart';
import 'package:airaystem/core/function/handlingdatacontroller.dart';
import 'package:airaystem/data/datasource/remote/forgetpassword/verifycodepass.dart';
import 'package:get/get.dart';
import '../../core/constant/routes.dart';

abstract class VerfiyCodeController extends GetxController {
  checkCode();
  goToResetPassword(String verifycode);
}

class VerfiyCodeControllerImp extends VerfiyCodeController {
  String? email;

  StatusRequest? statusRequest;

  VerifycodepassData verifycodepassData = VerifycodepassData(Get.find());

  @override
  checkCode() {}

  @override
  goToResetPassword(verifycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifycodepassData.postdata(email!, verifycode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.resetPassword, arguments: {"email": email});
      } else {
        Get.defaultDialog(
          title: "Warning",
          middleText: "Verify Code Not Correct",
        );
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
