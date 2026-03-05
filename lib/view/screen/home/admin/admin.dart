import 'package:airaystem/controller/admin_controller.dart';
import 'package:airaystem/core/constant/color.dart';
import 'package:airaystem/view/models/home.dart';
import 'package:airaystem/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AdminController());

    return Scaffold(
      appBar: AppBar(title: Text('Admin'), centerTitle: true),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Admin Account: ran@gmail.com',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          ListTile(
            title: Text('Manage Users'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          Divider(color: AppColor.green.withOpacity(0.2), thickness: 5),
          ListTile(
            title: Text('System Settings'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          Divider(color: AppColor.green.withOpacity(0.2), thickness: 5),
          ListTile(
            title: Text('Support'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          ListTile(
            title: Text('Feedback'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 0) {
            Get.to(() => HomePage());
          } else if (index == 1) {
            Get.to(() => Settings());
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
        ],
      ),
    );
  }
}
