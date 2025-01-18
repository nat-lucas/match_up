import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:match_up/core/route/route.dart';

class SplashController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    Timer(
      Duration(seconds: 3),
      () {
        Get.offAllNamed(Approute.subcription);
      },
    );
  }

  void checkUser() async {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      Get.offAllNamed(Approute.subcription);
    } else {
      Get.offAllNamed(Approute.onboarding);
    }
  }
}
