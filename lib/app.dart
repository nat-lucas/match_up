import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:match_up/feature/auth/screen/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Match Up",
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}