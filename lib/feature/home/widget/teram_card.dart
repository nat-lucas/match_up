import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:match_up/core/utils/color.dart';
import '../../../core/global/custom_text_poppins.dart';

class TeramCard extends StatelessWidget {
  final String image;
  final String text;
  const TeramCard({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: Color(0xffE3E3E9),
                width: 1.5,
              )),
          child: Image.asset(
            image,
          ),
        ),
        SizedBox(height: 5.h),
        CustomTextPopins(
          text: text,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w600,
          size: 12.sp,
          color: AppColor.blackborder,
        ),
      ],
    );
  }
}
