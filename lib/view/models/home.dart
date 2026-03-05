import 'package:airaystem/controller/models/sensor_controller.dart';
import 'package:airaystem/controller/rooms_controller/enviromentalarem_controller.dart';
import 'package:airaystem/core/constant/color.dart';
import 'package:airaystem/core/constant/imageassets.dart';
import 'package:airaystem/view/models/deviceandroom/devicepage.dart';
import 'package:airaystem/view/models/deviceandroom/roompage.dart';
import 'package:airaystem/view/models/notifications/NotificationsPage.dart';
import 'package:airaystem/view/rooms/buildbutton.dart';
import 'package:airaystem/view/rooms/buildsensorcard.dart';
import 'package:airaystem/view/screen/home/admin/admin.dart';
import 'package:airaystem/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final SensorController controller = Get.put(SensorController());
  final EnviromentalaremController alarmController = Get.put(
    EnviromentalaremController(),
  );

  final RxInt _selectedIndex = 0.obs;

  final List<Widget> pages = [const _MainPage(), Settings()];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColor.backGroundColor,
        body: SafeArea(child: pages[_selectedIndex.value]),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex.value,
          onTap: (index) {
            _selectedIndex.value = index;
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

class _MainPage extends GetView<SensorController> {
  const _MainPage();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ===== Header =====
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(AppModulesImages.avatar),
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(width: 10),
              const Text(
                "Hi Raneem",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColor.black,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Get.to(() => AdminPage()),
                child: const Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(Icons.person_2_outlined),
                ),
              ),
              GestureDetector(
                onTap: () => Get.to(() => NotificationsPage()),
                child: const Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(Icons.notifications_none),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          const Text(
            "My Home",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: AppColor.black,
            ),
          ),
          const SizedBox(height: 25),

          // ===== Temperature Card =====
          Obx(() {
            return BuildSensorCard(
              value:
                  controller.isLoading.value
                      ? "Loading..."
                      : "${controller.sensorData.value.temperature}°C",
              title: 'Temperature',
              iconData: Icons.thermostat,
            );
          }),
          const SizedBox(height: 20),
          // ===== Humidity Card =====
          Obx(() {
            return BuildSensorCard(
              value:
                  controller.isLoading.value
                      ? "Loading..."
                      : "${controller.sensorData.value.humidity}%",
              title: 'Humidity',
              iconData: Icons.water_drop,
            );
          }),
          const SizedBox(height: 30),

          // ===== Navigation Buttons =====
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BuildButton(
                iconData: Icons.meeting_room,
                label: "Rooms",
                onTap: () => Get.to(() => RoomPage()),
              ),
              BuildButton(
                iconData: Icons.devices,
                label: "Devices",
                onTap: () => Get.to(() => DevicesPage()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
