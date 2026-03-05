import 'package:airaystem/controller/rooms_controller/roompagecontroller.dart';
import 'package:airaystem/core/constant/color.dart';
import 'package:airaystem/view/models/home.dart';
import 'package:airaystem/view/models/notifications/NotificationsPage.dart';
import 'package:airaystem/view/rooms/bedroom.dart';
import 'package:airaystem/view/rooms/livingroom.dart';
import 'package:airaystem/view/rooms/officeroom.dart';
import 'package:airaystem/view/screen/home/admin/admin.dart';
import 'package:airaystem/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoomPage extends StatelessWidget {
  const RoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RoomController controller = Get.put(RoomController());

    final RxInt _selectedIndex = 0.obs;

    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backGroundColor,
        elevation: 0,
        foregroundColor: AppColor.black,
        title: Row(
          children: [
            const Text(
              "Rooms",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const Spacer(),
            Container(padding: const EdgeInsets.only(right: 15)),
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(
          () => GridView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: controller.rooms.length + 1,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              if (index < controller.rooms.length) {
                final room = controller.rooms[index];
                return _roomCard(room.name, room.devices, room.icon);
              } else {
                return _addRoomCard();
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: _selectedIndex.value,
          onTap: (index) {
            _selectedIndex.value = index;
            if (index == 0) {
              // إعادة التوجيه إلى الصفحة الرئيسية
              Get.to(() => HomePage());
            } else if (index == 1) {
              // إعادة التوجيه إلى صفحة الإعدادات أو أي صفحة أخرى
              Get.to(() => Settings()); // افترض أن هناك صفحة Settings
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

  static Widget _roomCard(String name, String devices, IconData icon) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        if (name == "Living Room") {
          Get.offAll(() => LivingRoom());
        } else if (name == "Bedroom") {
          Get.offAll(() => BedroomPage());
        } else if (name == "Office") {
          Get.offAll(() => OfficeRoom());
        }
      },

      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColor.secondColor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: AppColor.black),
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              devices,
              style: const TextStyle(color: AppColor.gray, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _addRoomCard() {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Get.snackbar("Room", "Add new room clicked");
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.green.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColor.green, width: 2),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: const Center(
          child: Icon(Icons.add, size: 40, color: AppColor.green),
        ),
      ),
    );
  }
}
