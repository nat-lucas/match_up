import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class LiveScoreSSE extends StatefulWidget {
  const LiveScoreSSE({super.key});
  @override
  State<LiveScoreSSE> createState() => _LiveScoreSSEState();
}

class _LiveScoreSSEState extends State<LiveScoreSSE> {
  String _liveScore = "Connecting to live score...";
  HttpClient? _httpClient;
  HttpClientRequest? _request;
    String _lastData = ""; 
  HttpClientResponse? _response;

  @override
  void initState() {
    super.initState();
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
            print("🔔 Data updated at $timestamp: $newData");
            _lastData = newData;
          }

          setState(() {
            _liveScore = 'Live Score:\n$newData';
          });
        }
      }, onError: (error) {
        print("❌ SSE error: $error");
        setState(() {
          _liveScore = 'SSE Error: $error';
        });
      });
    } catch (e) {
      print("❌ Connection failed: $e");
      setState(() {
        _liveScore = 'Connection failed: $e';
      });
    }
  }

  @override
  void dispose() {
    _httpClient?.close(force: true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Live Score')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            _liveScore,
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
