import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:match_up/core/route/route.dart';
import 'package:match_up/core/utils/color.dart';
import 'package:match_up/core/utils/image.dart';

void showThanksDialog() {
  Get.defaultDialog(
    title: "",
    backgroundColor: AppColor.white,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          ImagePath.love,
          height: 55.h,
          width: 55.w,
        ),
        SizedBox(height: 10.h),
        Text('Thanks!',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 20.sp,
                color: Colors.black,
              ),
            )),
        SizedBox(height: 5),
        Text('Your premium version has been Purchase complete',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: Colors.black87,
              ),
            )),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Get.back();
            Get.offAllNamed(Approute.chose);
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(horizontal: 80.r, vertical: 15),
            backgroundColor: AppColor.primaryColor,
          ),
          child: Text('Choose Sports',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: Colors.white,
                ),
              )),
        ),
      ],
    ),
    barrierDismissible: false,
  );
}
