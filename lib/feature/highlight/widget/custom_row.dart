import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:match_up/core/global/custom_text_poppins.dart';
import '../../../core/utils/color.dart';

class CustomRow extends StatelessWidget {
  final String imagePath;
  final String teamScore;
  final String value1;
  final String value2;
  final String value3;

  const CustomRow({
    super.key,
    required this.imagePath,
    required this.teamScore,
    required this.value1,
    required this.value2,
    required this.value3,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              imagePath,
              height: 50.h,
              width: 50.w,
            ),
               CustomTextPopins(
              text: "vs",
              fontWeight: FontWeight.w500,
              size: 11.sp,
              color: AppColor.blackborder,
            ),
               Image.asset(
              imagePath,
              height: 50.h,
              width: 50.w,
            ),
            SizedBox(
              height: 5.w,
            ),
            CustomTextPopins(
              text: "",
              fontWeight: FontWeight.w500,
              size: 11.sp,
              color: AppColor.blackborder,
            ),
          ],
        ),
        CustomTextPopins(
          text: value1,
          fontWeight: FontWeight.w500,
          size: 11.sp,
          color: AppColor.blackborder,
        ),
        CustomTextPopins(
          text: value2,
          fontWeight: FontWeight.w500,
          size: 11.sp,
          color: AppColor.blackborder,
        ),
        CustomTextPopins(
          text: value3,
          fontWeight: FontWeight.w500,
          size: 11.sp,
          color: AppColor.blackborder,
        ),
      ],
    );
  }
}
