import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(title: "20".tr, middleText: "21".tr, actions: [
    ElevatedButton(
        onPressed: () {
          exit(0);
        },
        child: Text("22".tr)),
    ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text("23".tr)),
  ]);
  return Future.value(true);
}
