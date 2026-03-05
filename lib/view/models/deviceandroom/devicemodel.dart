import 'package:flutter/material.dart';

class DeviceModel {
  final String name;
  final String rooms;
  final IconData icon;

  DeviceModel({required this.name, required this.rooms, required this.icon});

  static final List<DeviceModel> devices = [
    DeviceModel(name: "iPhone", rooms: "5 Rooms", icon: Icons.phone_iphone),
    DeviceModel(name: "Tablet", rooms: "3 Rooms", icon: Icons.tablet_mac),
  ];

  static void addDevice(DeviceModel newDevice) {
    devices.add(newDevice);
  }

  static void removeDevice(DeviceModel device) {
    devices.remove(device);
  }

  static void updateRooms(DeviceModel device, String newRoomCount) {
    final index = devices.indexOf(device);
    if (index != -1) {
      devices[index] = DeviceModel(
        name: device.name,
        rooms: newRoomCount,
        icon: device.icon,
      );
    }
  }
}
