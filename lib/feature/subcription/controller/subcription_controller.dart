import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:match_up/feature/subcription/controller/key.dart';

class SubscriptionController extends GetxController {
  var selectedPlan = -1.obs;

  var buttonText = 'Continue'.obs;

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
      "sub": "You can pick only 2 teams (in any sport)",
      "isvalue": true
    },
    {
      "name": "Premium version",
      "sub": "\$.99 and you can pick unlimited teams to get updates",
      "isvalue": false
    },
  ].obs;

 

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
          merchantDisplayName: "Unforgettable Getaway",
        ),
      );

      await _processPayment();
    } catch (e) {
      debugPrint("====== CatchError ====== $e");
    }
  }

  Future<void> _processPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      debugPrint("Payment successful!");
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
        debugPrint("Response Data ========>>>: ${response.data}");
        return response.data['client_secret'];
      } else {
        debugPrint("Failed to create Payment Intent: ${response.data}");
      }
    } catch (e) {
      debugPrint("===== CatchError in _createPaymentIntent ===== $e");
    }
    return null;
  }
}
