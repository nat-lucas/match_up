import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool visible = false.obs;

  changeVisible() {
    visible.value = !visible.value;
  }
}
