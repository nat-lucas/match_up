import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:match_up/core/network_caller/service/service.dart';
import 'package:match_up/feature/highlight/model/hightlight.dart';

class HighlightController extends GetxController {
  RxBool isLoading = false.obs;

  final RxList<Highlight> highlight = <Highlight>[].obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> highlightMatch() async {
    isLoading.value = true;
    String userId = _auth.currentUser?.uid ?? '';

    if (userId.isEmpty) {
      debugPrint("=========No user is signed in.");
      isLoading.value = false;
    } else {
      try {
        final response = await NetworkCaller().getRequest(
          "https://api.sportscard.us/api/v1/sports/highlights/$userId",
        );

        if (response.isSuccess) {
          debugPrint('==== Raw data: ======== ${response.responseData}');

          final MatchResponse matchResponse =
              MatchResponse.fromJson(response.responseData);

          highlight.value = matchResponse.result ?? [];

          debugPrint('Loaded ${highlight.length} highlight(s).');
        } else {
          debugPrint('Error fetching data: ${response.responseData}');
        }
      } catch (e) {
        debugPrint("Exception occurred: $e");
      } finally {
        isLoading.value = false;
      }
    }
  }
}
