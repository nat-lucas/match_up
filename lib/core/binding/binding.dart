import 'package:get/get.dart';
import 'package:match_up/feature/auth/controller/auth_controller.dart';
import 'package:match_up/feature/select_sport/controller/sport_controller.dart';
import 'package:match_up/feature/splash/controller/splash_controller.dart';
import 'package:match_up/feature/subcription/controller/subcription_controller.dart';

class Appbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(AuthController());
    Get.lazyPut(
      () => SubscriptionController(),
    );
    Get.put(SportController());
  }
}
