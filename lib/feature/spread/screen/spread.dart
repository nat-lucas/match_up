import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:match_up/core/utils/image.dart';

import 'package:match_up/feature/spread/widget/custom_row.dart';
import '../../../core/global/custom_text_poppins.dart';
import '../../../core/utils/color.dart';

class Spread extends StatelessWidget {
  const Spread({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: CustomTextPopins(
          text: "Highlights",
          fontWeight: FontWeight.w600,
          size: 24.sp,
          color: AppColor.blackborder,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Column(
            spacing: 20.h,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextPopins(
                    text: "Mon. 1/9/25, 4.00pm",
                    fontWeight: FontWeight.w600,
                    size: 11.sp,
                    color: AppColor.blackborder,
                  ),
                  CustomTextPopins(
                    text: "Money Line",
                    fontWeight: FontWeight.w600,
                    size: 11.sp,
                    color: AppColor.blackborder,
                  ),
                  CustomTextPopins(
                    text: "Pt Spread",
                    fontWeight: FontWeight.w600,
                    size: 11.sp,
                    color: AppColor.blackborder,
                  ),
                  CustomTextPopins(
                    text: "Total Pts",
                    fontWeight: FontWeight.w600,
                    size: 11.sp,
                    color: AppColor.blackborder,
                  ),
                ],
              ),
              CustomRow(
                  imagePath: ImagePath.team1,
                  teamScore: "(16-18)",
                  value1: "+200",
                  value2: "+6.5",
                  value3: "0 225.5"),
              CustomRow(
                  imagePath: ImagePath.team4,
                  teamScore: "(16-18)",
                  value1: "+200",
                  value2: "+6.5",
                  value3: "0 225.5"),
              CustomRow(
                  imagePath: ImagePath.team3,
                  teamScore: "(16-18)",
                  value1: "+200",
                  value2: "+6.5",
                  value3: "0 225.5"),
            ],
          ),
        ),
      ),
    );
  }
}
