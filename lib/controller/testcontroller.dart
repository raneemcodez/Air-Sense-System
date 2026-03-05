import 'package:get/get.dart';
import 'package:airaystem/core/class/statuesrequest.dart';
import 'package:airaystem/core/function/handlingdatacontroller.dart';
import 'package:airaystem/data/datasource/remote/test_data.dart';

class Testcontroller extends GetxController {
  TestData testData = TestData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();
    print("======================= Controller $response");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['statues'] == 'success') {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
