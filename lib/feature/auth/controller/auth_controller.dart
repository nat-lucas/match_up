import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match_up/core/route/route.dart';

class AuthController extends GetxController {
  TextEditingController lemail = TextEditingController();
  TextEditingController lpassword = TextEditingController();
  TextEditingController semail = TextEditingController();
  TextEditingController spassword = TextEditingController();
  TextEditingController cofirmpassword = TextEditingController();
  TextEditingController forgot = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxBool visible = true.obs;
  RxBool isLoading = false.obs;
  changeVisible() {
    visible.value = !visible.value;
  }

  Future<void> signUpWithEmailAndPassword() async {
    try {
      isLoading.value = true;
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: semail.text,
        password: spassword.text,
      );
      await _firestore.collection('user').doc(userCredential.user?.uid).set({
        "email": semail.text,
        "password": cofirmpassword.text,
        "member": false,
        "name": "Unknown",
      });
      await login2(semail.text, cofirmpassword.text);
      Get.snackbar("Success", "Account created successfully!",
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      isLoading.value = false;
      debugPrint("===========>>$e");
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login2(String email, String password) async {
    debugPrint("====Login api hitted");
    UserCredential userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    if (userCredential.user != null) {
      debugPrint("=======${userCredential.user?.uid}");
      debugPrint("=======${userCredential.user?.email}");
      Get.offAllNamed(Approute.subcription, arguments: {
        "inUser": false,
      });
    }
  }

  Future<void> login() async {
    try {
      isLoading.value = true;

      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: lemail.text, password: lpassword.text);

      if (userCredential.user != null) {
        Get.offAllNamed(Approute.navbar);
        Get.snackbar("Success", "Login successful!",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("Login failed: $e");
      Get.snackbar("Error", "Login failed: $e",
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: forgot.text);
      Get.snackbar("Succesfull", "Reset Password Email send Done");
      Get.offNamed(Approute.login);

      debugPrint("Password reset email sent.");
    } catch (e) {
      debugPrint("Error: $e");
    }
  }
}
