import 'package:airaystem/controller/models/sensor_controller.dart';
import 'package:airaystem/controller/rooms_controller/enviromentalarem_controller.dart';
import 'package:airaystem/core/constant/color.dart';
import 'package:airaystem/core/constant/imageassets.dart';
import 'package:airaystem/core/constant/routes.dart';
import 'package:airaystem/view/rooms/buildsensorcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BedroomPage extends StatelessWidget {
  BedroomPage({super.key});

  final RxInt _selectedIndex = 0.obs;

  final SensorController sensorController = Get.put(SensorController());
  final EnviromentalaremController controller = Get.put(
    EnviromentalaremController(),
  );

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Image.asset(
                    AppRoomImage.bedRoom,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: height / 2,
                  ),
                  Container(
                    height: height / 2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.secondColor,
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.secondColor,
                          blurRadius: 20,
                          spreadRadius: 20,
                          offset: Offset(5, 0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.black.withOpacity(0.5),
                            blurRadius: 100,
                            spreadRadius: 100,
                            offset: Offset(5, 0),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppRoute.roomPage);
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 30,
                              color: AppColor.secondColor,
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                "Bed Room",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.secondColor,
                                ),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.notifications_outlined,
                            color: AppColor.secondColor,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height / 2 - 100),
                    Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.14,
                          width: 380,
                          child: Obx(() {
                            if (!sensorController.isLoading.value) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                controller.checkEnvironmentAlert(
                                  temperature:
                                      sensorController
                                          .sensorData
                                          .value
                                          .temperature,
                                  humidity:
                                      sensorController
                                          .sensorData
                                          .value
                                          .humidity,
                                );
                              });
                            }

                            return BuildSensorCard(
                              value:
                                  sensorController.isLoading.value
                                      ? "Loading..."
                                      : "${sensorController.sensorData.value.temperature}°C",
                              title: 'Temperature',
                              iconData: Icons.thermostat,
                            );
                          }),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.14,
                          width: 380,
                          child: Obx(() {
                            return BuildSensorCard(
                              value:
                                  sensorController.isLoading.value
                                      ? "Loading..."
                                      : "${sensorController.sensorData.value.humidity}%",
                              title: 'Humidity',
                              iconData: Icons.water_drop,
                            );
                          }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: _selectedIndex.value,
          onTap: (index) {
            _selectedIndex.value = index;
            if (index == 0) {
              Get.toNamed(AppRoute.home);
            } else if (index == 1) {
              Get.toNamed(AppRoute.settings);
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
          ],
        ),
      ),
    );
  }
}
