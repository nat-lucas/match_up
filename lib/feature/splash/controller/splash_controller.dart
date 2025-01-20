import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
      debugPrint("======User is logged in.");
      debugPrint('User ID: ${currentUser.uid}');
      debugPrint('User Email: ${currentUser.email}');
      debugPrint('User Name: ${currentUser.displayName}');
      Get.offAllNamed(Approute.navbar);
    } else {
      debugPrint("User is not logged in.");
      Get.offAllNamed(Approute.onboarding);
    }
  }
}
