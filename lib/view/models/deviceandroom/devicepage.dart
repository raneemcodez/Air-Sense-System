import 'package:airaystem/core/constant/color.dart';
import 'package:airaystem/view/models/deviceandroom/devicemodel.dart';
import 'package:flutter/material.dart';

class DevicesPage extends StatelessWidget {
  const DevicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final devices = DeviceModel.devices;

    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backGroundColor,
        elevation: 0,
        foregroundColor: Colors.black,
        title: Row(
          children: [
            const Text(
              "Devices",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.only(right: 15),
              child: const Icon(Icons.person_2_outlined),
            ),
            const Icon(Icons.notifications_none),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: devices.length + 1, // +1 لإضافة زر
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            if (index == devices.length) {
              return _addDeviceCard(); // المربع الزائد
            }
            final device = devices[index];
            return _deviceCard(device.name, device.rooms, device.icon);
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
        ],
      ),
    );
  }

  static Widget _deviceCard(String name, String rooms, IconData icon) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {},
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
              rooms,
              style: const TextStyle(color: AppColor.gray, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _addDeviceCard() {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColor.green.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColor.gray.withOpacity(0.4), width: 1),
        ),
        child: const Center(
          child: Icon(Icons.add, size: 40, color: AppColor.gray),
        ),
      ),
    );
  }
}
