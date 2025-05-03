import 'package:get/get.dart';
import 'package:match_up/feature/auth/controller/auth_controller.dart';
import 'package:match_up/feature/nav_bar/controller/navcontroller.dart';
import 'package:match_up/feature/notification/controller/notification_controller.dart';
import 'package:match_up/feature/select_sport/controller/sport_controller.dart';
import 'package:match_up/feature/setting/controller/edit_team_controller.dart';
import 'package:match_up/feature/setting/controller/setting_controller.dart';
import 'package:match_up/feature/splash/controller/splash_controller.dart';
import 'package:match_up/feature/subcription/controller/subcription_controller.dart';

class Appbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(AuthController());
    Get.put(SportController());
    Get.put(NavController());
    Get.put(EditTeamController());
    Get.put(SubscriptionController() );
    Get.put( NotificationController());
    Get.put(SettingController());
  }
}
