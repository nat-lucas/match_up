import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController lemail = TextEditingController();
  TextEditingController lpassword = TextEditingController();
  TextEditingController semail = TextEditingController();
  TextEditingController spassword = TextEditingController();
  TextEditingController cofirmpassword = TextEditingController();

  RxBool visible = false.obs;
  changeVisible() {
    visible.value = !visible.value;
  }

  
}
