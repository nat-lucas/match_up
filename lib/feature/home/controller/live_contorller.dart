import 'dart:convert';
import 'dart:developer' show log;
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:match_up/feature/select_sport/controller/sport_controller.dart';
import '../model/live_scoor.dart';

class LiveScoreController extends GetxController {
  final SportController sportController = Get.find<SportController>();
  final RxString liveScore = "Connecting to live score...".obs;
  final RxList<LiveScore> liveScores = <LiveScore>[].obs;
  RxBool isLoading = false.obs;
    RxString status = "".obs;

  HttpClient? _httpClient;
  String _lastData = "";

  @override
  void onInit() {
    super.onInit();
    _connectToSSE();
  }

  Future<void> _connectToSSE() async {
    debugPrint("==================<><>${sportController.teamId.value}");
    final url =
        'https://api.sportscard.us/api/v1/sports/live-score?matchId=${sportController.teamId.value}';
    final uri = Uri.parse(url);
    _httpClient = HttpClient();

    try {
      isLoading.value = true;
      final request = await _httpClient!.getUrl(uri);
      request.headers.set(HttpHeaders.acceptHeader, 'text/event-stream');

      final response = await request.close();

      response.transform(utf8.decoder).transform(const LineSplitter()).listen(
        (line) {
          if (line.startsWith('data:')) {
            final newData = line.replaceFirst('data:', '').trim();

            if (newData != _lastData) {
              _lastData = newData;
              final timestamp = DateTime.now().toLocal().toString();
              log("🔔 Data updated at $timestamp: $newData");

              try {
                final List<dynamic> jsonData = jsonDecode(newData);
                final List<LiveScore> newScores =
                    jsonData.map((e) => LiveScore.fromJson(e)).toList();

                liveScores.assignAll(newScores);
                liveScore.value = 'Live Score Updated at $timestamp';
                log("🔔 Live scores updated: $newScores");
              } catch (e) {
                debugPrint("❌ JSON Parse Error: $e");
              }
            }
          }
        },
        onError: (error) {
          debugPrint("❌ SSE Error: $error");
          liveScore.value = 'SSE Error: $error';
        },
      );
    } catch (e) {
      isLoading.value = false;
      debugPrint("❌ Connection Failed: $e");
      liveScore.value = 'Connection failed: $e';
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    _httpClient?.close(force: true);
    super.onClose();
  }
}
