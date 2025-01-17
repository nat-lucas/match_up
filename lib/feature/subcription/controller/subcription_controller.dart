import 'package:get/get.dart';

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
}
