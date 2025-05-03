import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match_up/core/helper/sharedprefarences.dart';
import 'package:match_up/core/route/route.dart';
import 'package:match_up/feature/nav_bar/controller/navcontroller.dart';
import 'package:match_up/feature/select_sport/controller/sport_controller.dart';

class AuthController extends GetxController {
  SharedPreferencesHelper preferencesHelper = SharedPreferencesHelper();
  final SportController sportController = Get.find<SportController>();
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
  NavController navController = Get.put(NavController());
  changeVisible() {
    visible.value = !visible.value;
  }

  Future<void> signUpWithEmailAndPassword() async {
    preferencesHelper.init();
    try {
      isLoading.value = true;
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: semail.text,
        password: spassword.text,
      );
      await _firestore.collection('user').doc(userCredential.user?.uid).set({
        "email": semail.text,
        "password": cofirmpassword.text,
        "fcm_token": preferencesHelper.getString("fcm_token"),
        "member": false,
        "purchase-date": "",
        "expire-date": "",
        "name": "Unknown",
      });
      await login2(semail.text, cofirmpassword.text);
      Get.snackbar("Success", "Account created successfully!",
          colorText: Colors.white,
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM);
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      String errorMessage = "An error occurred";

      if (e.code == 'email-already-in-use') {
        errorMessage = "This email is already in use. Try logging in instead.";
      } else if (e.code == 'weak-password') {
        errorMessage = "Your password is too weak. Try a stronger one!";
      } else if (e.code == 'invalid-email') {
        errorMessage = "Invalid email format!";
      }

      Get.snackbar("Error", errorMessage,
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red);
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

      if (lemail.text.isEmpty || lpassword.text.isEmpty) {
        Get.snackbar("Error", "Email and password cannot be empty.",
            snackPosition: SnackPosition.TOP,
            colorText: Colors.white,
            backgroundColor: Colors.red);
        isLoading.value = false;
        return;
      }

      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: lemail.text.trim(),
        password: lpassword.text.trim(),
      );

      if (userCredential.user != null) {
        await _firestore
            .collection('user')
            .doc(userCredential.user?.uid)
            .update({
          "fcm_token": preferencesHelper.getString("fcm_token"),
        });
        await sportController.getFirestoreSelection();
        navController.currentIndex.value = 0;
        Get.offAllNamed(Approute.navbar);
        Get.snackbar("Success", "Login successful!",
            colorText: Colors.white,
            backgroundColor: Colors.green,
            snackPosition: SnackPosition.TOP);
      }
    } on FirebaseAuthException catch (e) {
      log("Firebase Auth Error: ${e.code}");

      isLoading.value = false;

      String errorMessage = "Login failed";

      switch (e.code) {
        case 'invalid-credential':
        case 'user-not-found':
          errorMessage = "No account found for this email.";
          break;
        case 'wrong-password':
          errorMessage = "Incorrect password. Please try again.";
          break;
        case 'invalid-email':
          errorMessage = "Invalid email format.";
          break;
        case 'user-disabled':
          errorMessage = "This account has been disabled.";
          break;
        default:
          errorMessage = e.message ?? "An unexpected error occurred.";
          break;
      }

      Get.snackbar("Error", errorMessage,
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red);
    } catch (e) {
      isLoading.value = false;
      log("Unexpected error: $e");

      Get.snackbar("Error", "An unexpected error occurred.",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resetPassword() async {
    final email = forgot.text.trim();

    if (email.isEmpty) {
      Get.snackbar("Error", "Please enter your email.",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red);
      return;
    }

    try {
      isLoading.value = true;
      // Get all user documents
      final querySnapshot =
          await FirebaseFirestore.instance.collection('user').get();

      // Find a user with the matching email (case insensitive)
      final matchingUser = querySnapshot.docs.where((doc) {
        final userEmail = (doc.data()['email'] as String?)?.toLowerCase();
        return userEmail == email.toLowerCase();
      }).toList();

      if (matchingUser.isEmpty) {
        Get.snackbar("Error", "No account found for this email.",
            snackPosition: SnackPosition.TOP,
            colorText: Colors.white,
            backgroundColor: Colors.red);
        return;
      }

      // Send the reset email
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      Get.snackbar("Success", "Reset password email sent!",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.green);

      Get.offNamed(Approute.login);
    } on FirebaseAuthException catch (e) {
      String errorMessage = "Failed to send reset email.";

      if (e.code == 'invalid-email') {
        errorMessage = "Invalid email format.";
      }

      Get.snackbar("Error", errorMessage,
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red);
    } catch (e) {
      isLoading.value = false;
      debugPrint("Error: $e");
      Get.snackbar("Error", "Something went wrong. Please try again.",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }
}
