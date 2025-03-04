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

      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: lemail.text, password: lpassword.text);

      if (userCredential.user != null) {
        Get.offAllNamed(Approute.navbar);
        Get.snackbar("Success", "Login successful!",
            colorText: Colors.white,
            backgroundColor: Colors.green,
            snackPosition: SnackPosition.TOP);
      }
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;

      String errorMessage = "Login failed";

      if (e.code == 'user-not-found') {
        errorMessage = "No account found for that email.";
      } else if (e.code == 'wrong-password') {
        errorMessage = "Incorrect password. Please try again.";
      } else if (e.code == 'invalid-email') {
        errorMessage = "Invalid email format.";
      } else if (e.code == 'user-disabled') {
        errorMessage = "This account has been disabled.";
      }

      debugPrint("Login failed: ${e.message}");
      Get.snackbar("Error", errorMessage,
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red);
    } catch (e) {
      isLoading.value = false;
      debugPrint("Unexpected error: $e");
      Get.snackbar("Error", "An unexpected error occurred.",
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
