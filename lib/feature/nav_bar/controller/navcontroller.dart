import 'package:get/get.dart';
import 'package:match_up/feature/highlight/controller/controller.dart';

class NavController extends GetxController {
  final HighlightController highlightController =
      Get.find<HighlightController>();
  RxInt currentIndex = 0.obs;

  void updateIndex(int index) {
    currentIndex.value = index;
    if (currentIndex.value == 1 && highlightController.highlight.isEmpty) {
      highlightController.highlightMatch();
    }
  }
}
