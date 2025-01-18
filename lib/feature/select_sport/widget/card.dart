import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:match_up/core/utils/color.dart';

import '../../../core/global/custom_text_poppins.dart';

class SportCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isSelected;
  const SportCard({
    super.key,
    required this.image,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: isSelected ? Colors.red.shade100 : AppColor.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isSelected ? AppColor.primaryColor : AppColor.greyWhite,
          width: 1.5,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 55.h,
              width: 55.w,
            ),
            SizedBox(height: 5.h),
            CustomTextPopins(
              text: title,
              fontWeight: FontWeight.w600,
              size: 18.sp,
              color: AppColor.blackborder,
            ),
          ],
        ),
      ),
    );
  }
}
