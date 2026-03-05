import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airaystem/controller/testcontroller.dart';
import 'package:airaystem/core/class/handlingdataview.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Testcontroller());
    return Scaffold(
      appBar: AppBar(title: Text("Title")),
      body: GetBuilder<Testcontroller>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return Text("${controller.data}");
              },
            ),
          );
        },
      ),
    );
  }
}
