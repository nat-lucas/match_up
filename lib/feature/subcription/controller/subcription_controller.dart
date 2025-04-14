import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:match_up/core/global/dialog.dart';
import 'package:match_up/feature/select_sport/controller/sport_controller.dart';
import 'package:match_up/feature/subcription/controller/key.dart';

import '../../auth/controller/auth_controller.dart';

class SubscriptionController extends GetxController {
  final authcontroller = Get.find<AuthController>();
  final SportController sportController = Get.find<SportController>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var selectedPlan = -1.obs;

  var buttonText = 'Continue'.obs;
  var updgradgeText = "Upgrade".obs;

  void selectPlan(int index) {
    selectedPlan = index;

    if (selectedPlan == 1) {
      buttonText.value = 'Payment';
    } else {
      buttonText.value = 'Continue';
    }
  }

  final RxList plan = [
    {
      "name": "Free version",
      "sub": "You can pick a total of two teams in any sport to follow",
      "isvalue": true,
      "isPrice": false
    },
    {
      "name": "Premium version",
      "sub": "You can pick an unlimited amount of teams in any sport to follow",
      "isvalue": false,
      "isPrice": true
    },
  ].obs;

  Future<void> updateUserData() async {
    try {
      final currentUser = _auth.currentUser;

      if (currentUser != null) {
        await _firestore.collection('user').doc(currentUser.uid).update({
          "member": true,
        });

        debugPrint("User data updated successfully.");
         await sportController.getFirestoreSelection();
      } else {
        debugPrint("User is null, cannot update data.");
        Get.snackbar("Error", "User not found. Please log in again.",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      debugPrint("Error updating user data: $e");
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      debugPrint("Update user data process completed.");
    }
  }

  Future<void> makePayment(double price) async {
    try {
      String? clientSecret = await _createPaymentIntent(price, "usd");
      if (clientSecret == null) {
        debugPrint("==========+ Client Secret is null");
        return;
      }
      debugPrint("=========>>$clientSecret");

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: "MatchUp",
        ),
      );

      await _processPayment();
    } catch (e) {
      debugPrint("======CatchError====== $e");
    }
  }

  Future<void> _processPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      debugPrint("Payment successful!");
      await updateUserData();
     
      showThanksDialog();
    } catch (e) {
      debugPrint("Error in payment processing: $e");
    }
  }

  Future<String?> _createPaymentIntent(double price, String currency) async {
    try {
      final Dio dio = Dio();
      int amountInCents = (price * 100).toInt();

      Map<String, dynamic> data = {
        "amount": amountInCents.toString(),
        "currency": currency,
        "payment_method_types[]": "card",
      };

      final response = await dio.post(
        "https://api.stripe.com/v1/payment_intents",
        data: data,
        options: Options(
          headers: {
            "Authorization": "Bearer $seckerkey",
            "Content-Type": "application/x-www-form-urlencoded",
          },
        ),
      );

      debugPrint("Response Status Code: ${response.statusCode}");

      if (response.statusCode == 200 && response.data != null) {
        debugPrint("===\\Response Data ========>>>: ${response.data}");
        return response.data['client_secret'];
      } else {
        debugPrint(
            "Failed to create Payment Intent: ${response.statusMessage}");
      }
    } catch (e) {
      debugPrint("===== CatchError in _createPaymentIntent ===== $e");
    }
    return null;
  }
}
