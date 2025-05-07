import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match_up/core/routes/route.dart';
import 'package:match_up/core/utils/image.dart';
import 'package:match_up/feature/highlight/controller/controller.dart';
import 'package:match_up/feature/select_sport/controller/sport_controller.dart';

class SplashController extends GetxController {
  final SportController sportController = Get.put(SportController());
  final HighlightController highlightController =
      Get.put(HighlightController());
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    Timer(
      Duration(seconds: 3),
      () {
        checkUser();
      },
    );
  }

  logout() async {
    await _auth.signOut();
  }

  void checkUser() async {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      await Future.wait([
        if (Get.context != null)
          precacheImage(AssetImage(ImagePath.one), Get.context!),
        if (Get.context != null)
          precacheImage(AssetImage(ImagePath.two), Get.context!),
        if (Get.context != null)
          precacheImage(AssetImage(ImagePath.three), Get.context!),
        if (Get.context != null)
          precacheImage(AssetImage(ImagePath.four), Get.context!),
        sportController.getFirestoreSelection(),
      ]);
      await Future.delayed(const Duration(milliseconds: 500));
      Get.offAllNamed(Approute.navbar);
    } else {
      debugPrint("User is not logged in.");
      Get.offAllNamed(Approute.onboarding);
    }
  }
}
