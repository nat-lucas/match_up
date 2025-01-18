import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:match_up/core/global/custom_text_poppins.dart';

import '../../../core/utils/color.dart';

class TeamScoor extends StatelessWidget {
  final String title;
  final String image;
  final String subimage;
  const TeamScoor(
      {super.key,
      required this.title,
      required this.image,
      required this.subimage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 80.h,
          width: 80.w,
        ),
        Image.asset(image, height: 59.h, width: 59.w,),
        Positioned(
            bottom: 30,
            right: 10,
            child: Image.asset(
             subimage,
              height: 13.h,
              width: 13.w,
            )),
        Positioned(
          bottom: 0,
          child: CustomTextPopins(
            text: title,
            color: AppColor.blackborder,
            size: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
