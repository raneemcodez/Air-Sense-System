import 'package:airaystem/controller/settings_controller.dart';
import 'package:airaystem/core/constant/color.dart';
import 'package:airaystem/core/constant/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: Get.width / 2,
                width: double.infinity,
                color: AppColor.green.withOpacity(0.3),
              ),
              Positioned(
                top: Get.width / 2.5,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColor.backGroundColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColor.green.withOpacity(0.3),
                    backgroundImage: AssetImage(AppModulesImages.avatar),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 100),
          Container(
            padding: EdgeInsets.all(10),
            color: AppColor.backGroundColor,
            child: Card(
              color: AppColor.green.withOpacity(0.2),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    onTap: () {},
                    title: Text("Disable Notifications"),
                    trailing: Switch(onChanged: (val) {}, value: true),
                  ),
                  Divider(color: AppColor.backGroundColor, thickness: 5),
                  ListTile(
                    onTap: () {},
                    title: Text("About Us"),
                    trailing: Icon(Icons.help_outline_rounded),
                  ),
                  Divider(color: AppColor.backGroundColor, thickness: 5),
                  ListTile(
                    onTap: () {},
                    title: Text("Contact Us"),
                    trailing: Icon(Icons.message_rounded),
                  ),
                  Divider(color: AppColor.backGroundColor, thickness: 5),
                  ListTile(
                    onTap: () {
                      controller.logout();
                    },
                    title: Text("Log Out"),
                    trailing: Icon(Icons.exit_to_app),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
