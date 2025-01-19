import 'package:get/get.dart';

class SettingController extends GetxController {
  var isSwitchOn = false.obs;
   var expandedIndex = (-1).obs;

  void toggleSwitch(bool value) {
    isSwitchOn.value = value;
  }
}
