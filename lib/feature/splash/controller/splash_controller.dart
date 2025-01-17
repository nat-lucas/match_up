import 'dart:async';

import 'package:get/get.dart';
import 'package:match_up/core/route/route.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(
      Duration(seconds: 3),
      () {
        Get.toNamed(Approute.onboarding);
      },
    );
  }
}
