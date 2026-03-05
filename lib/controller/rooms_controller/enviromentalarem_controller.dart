import 'package:airaystem/core/class/statuesrequest.dart';
import 'package:get/get.dart';

class EnviromentalaremController extends GetxController {
  var temperature = 0.0.obs;
  var humidity = 0.0.obs;

  StatusRequest statusRequest = StatusRequest.none;

  void fetchSensorData() async {
    statusRequest = StatusRequest.loading;
    update();

    try {
      await Future.delayed(Duration(seconds: 2));
      double newTemp = 35.5;
      double newHumidity = 80;

      updateSensorData(newTemp, newHumidity);

      statusRequest = StatusRequest.success;
    } catch (e) {
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  void updateSensorData(double newTemp, double newHumidity) {
    temperature.value = newTemp;
    humidity.value = newHumidity;

    checkEnvironmentAlert(temperature: newTemp, humidity: newHumidity);
  }

  void checkEnvironmentAlert({
    required double temperature,
    required double humidity,
  }) {
    if (temperature > 60) {
      Get.defaultDialog(title: "48".tr, middleText: "49".tr);
    }

    if (humidity > 50) {
      Get.defaultDialog(title: "48".tr, middleText: "50".tr);
    }
  }
}
