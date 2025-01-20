import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match_up/core/utils/color.dart';

class CustomDialog {
  static void show({
    required String title,
    required String message,
    required VoidCallback onYes,
    VoidCallback? onNo,
    String yesText = "Yes",
    String noText = "No",
  }) {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        content: Text(
          message,
          style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade600),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (onNo != null) onNo();
              Get.back();
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey,
            ),
            child: Text(noText),
          ),
          ElevatedButton(
            onPressed: () {
              onYes();
              Get.back();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            child: Text(
              yesText,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      barrierDismissible: true,
    );
  }
}
