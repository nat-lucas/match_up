import 'package:get/get.dart';
import 'package:match_up/feature/splash/controller/splash_controller.dart';

class Appbinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}