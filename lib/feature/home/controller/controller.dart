import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LiveScoreController extends GetxController {
  final RxString liveScore = "Connecting to live score...".obs;
  HttpClient? _httpClient;
  String _lastData = "";

  @override
  void onInit() {
    super.onInit();
    _connectToSSE();
  }

  Future<void> _connectToSSE() async {
    const url = 'http://10.0.20.13:5001/api/v1/sports/live-score?matchId=139141';
    final uri = Uri.parse(url);
    _httpClient = HttpClient();

    try {
      final request = await _httpClient!.getUrl(uri);
      request.headers.set(HttpHeaders.acceptHeader, 'text/event-stream');

      final response = await request.close();

      response.transform(utf8.decoder).transform(const LineSplitter()).listen((line) {
        if (line.startsWith('data:')) {
          final newData = line.replaceFirst('data:', '').trim();

          if (newData != _lastData) {
            final timestamp = DateTime.now().toLocal().toString();
            debugPrint("🔔 Data updated at======== $timestamp: $newData");
            _lastData = newData;
          }

          liveScore.value = 'Live Score:\n$newData';
        }
      }, onError: (error) {
        debugPrint("❌========== SSE error: $error");
        liveScore.value = 'SSE Error: $error';
      });
    } catch (e) {
      debugPrint("❌ =========== Connection failed: $e");
      liveScore.value = 'Connection failed: $e';
    }
  }

  @override
  void onClose() {
    _httpClient?.close(force: true);
    super.onClose();
  }
}