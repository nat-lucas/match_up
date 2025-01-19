import 'package:get/get.dart';

class SettingController extends GetxController {
  var isSwitchOn = false.obs;

  void toggleSwitch(bool value) {
    isSwitchOn.value = value;
  }
}
