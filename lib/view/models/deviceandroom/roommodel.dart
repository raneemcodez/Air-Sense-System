import 'package:flutter/material.dart';

class RoomModel {
  final String name;
  final String devices;
  final IconData icon;

  RoomModel({required this.name, required this.devices, required this.icon});

  static final List<RoomModel> rooms = [
    RoomModel(name: "Living Room", devices: "5 Devices", icon: Icons.tv),
    RoomModel(name: "Bedroom", devices: "3 Devices", icon: Icons.bed),
    RoomModel(name: "Office", devices: "1 Device", icon: Icons.computer),
  ];

  static void addRoom(RoomModel newRoom) {
    rooms.add(newRoom);
  }

  static void removeRoom(RoomModel room) {
    rooms.remove(room);
  }

  static void updateDevices(RoomModel room, String newDeviceCount) {
    final index = rooms.indexOf(room);
    if (index != -1) {
      rooms[index] = RoomModel(
        name: room.name,
        devices: newDeviceCount,
        icon: room.icon,
      );
    }
  }
}
