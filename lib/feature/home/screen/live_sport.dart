import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match_up/core/utils/image.dart';
import 'package:match_up/feature/home/controller/live_contorller.dart';
import 'package:match_up/feature/home/widget/team_scoor.dart';

import '../../../core/global/custom_text_poppins.dart';
import '../../../core/utils/color.dart';

class LiveSport extends StatelessWidget {
  const LiveSport({super.key});

  @override
  Widget build(BuildContext context) {
    final LiveScoreController liveScoreController =
        Get.put(LiveScoreController());
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: CustomTextPopins(
          text: "Live Score",
          fontWeight: FontWeight.w600,
          size: 24.sp,
          color: AppColor.blackborder,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Container(
            padding: EdgeInsets.all(15.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: AppColor.greyWhite,
                width: 1.5,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TeamScoor(
                      image: ImagePath.team1,
                      subimage: ImagePath.basebol,
                      title: "CHICAGO CUBS",
                    ),
                    Column(
                      children: [
                        CustomTextPopins(
                          text: "04.01.2025",
                          fontWeight: FontWeight.w400,
                          size: 12.sp,
                          color: AppColor.blackborder,
                        ),
                        CustomTextPopins(
                          text: "1-3",
                          fontWeight: FontWeight.w700,
                          size: 27.sp,
                          color: AppColor.primaryColor,
                        ),
                        CustomTextPopins(
                            text: "2TH INING",
                            fontWeight: FontWeight.w400,
                            size: 12.sp,
                            color: AppColor.blackborder),
                      ],
                    ),
                    TeamScoor(
                      image: ImagePath.team4,
                      subimage: ImagePath.bol,
                      title: "BOSTON RED SOX",
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                CustomTextPopins(
                  text: "Match Overview",
                  fontWeight: FontWeight.w500,
                  size: 13.sp,
                  color: AppColor.blackborder,
                ),
                SizedBox(height: 5.h),
                CustomTextPopins(
                  text: "Summary",
                  fontWeight: FontWeight.w400,
                  size: 12.sp,
                  color: AppColor.blackborder,
                ),
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomTextPopins(
                    text: "R  1  2 3  4  5  6  7  8  9 EI  H E",
                    fontWeight: FontWeight.w400,
                    size: 12.sp,
                    color: AppColor.black,
                  ),
                ),
                SizedBox(height: 10.h),
                Divider(
                  color: AppColor.greyWhite,
                  thickness: 1.5,
                  height: 1.h,
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomTextPopins(
                      text: "CHICAGO CUBS",
                      fontWeight: FontWeight.w500,
                      size: 10.sp,
                      color: AppColor.black,
                    ),
                    Image.asset(
                      ImagePath.basebol,
                      height: 13.h,
                      width: 13.w,
                    ),
                    CustomTextPopins(
                      text: "4",
                      fontWeight: FontWeight.w400,
                      size: 12.sp,
                      color: AppColor.primaryColor,
                    ),
                    CustomTextPopins(
                      text: "1  0  0  0  0  0  0  1  1   9 0",
                      fontWeight: FontWeight.w400,
                      size: 12.sp,
                      color: AppColor.black,
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomTextPopins(
                      text: "BOSTON RED SOX",
                      fontWeight: FontWeight.w500,
                      size: 10.sp,
                      color: AppColor.black,
                    ),
                    Image.asset(
                      ImagePath.bol,
                      height: 13.h,
                      width: 13.w,
                    ),
                    CustomTextPopins(
                      text: "1",
                      fontWeight: FontWeight.w400,
                      size: 12.sp,
                      color: AppColor.primaryColor,
                    ),
                    CustomTextPopins(
                      text: "0  0  0  0  0  0  0  1  0   3 1",
                      fontWeight: FontWeight.w400,
                      size: 12.sp,
                      color: AppColor.black,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
