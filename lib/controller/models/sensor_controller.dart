import 'dart:convert';
import 'package:airaystem/data/datasource/remote/homepage/sensordata.dart';
import 'package:airaystem/linkapi.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SensorController extends GetxController {
  var isLoading = true.obs;
  var sensorData = SensorData(temperature: 0, humidity: 0).obs;

  get temperature => null;

  Future<void> fetchSensorData() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse(AppLink.getSensorData));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data is Map<String, dynamic>) {
          sensorData.value = SensorData.fromJson(data);
        }
      } else {
        print("Server error");
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    fetchSensorData();
    super.onInit();
  }
}
