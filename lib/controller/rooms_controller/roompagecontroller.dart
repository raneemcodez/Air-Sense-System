import 'package:get/get.dart';
import 'package:airaystem/view/models/deviceandroom/roommodel.dart';

class RoomController extends GetxController {
  final rooms = <RoomModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    rooms.assignAll(RoomModel.rooms);
  }
}
