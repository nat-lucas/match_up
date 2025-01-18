import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:match_up/core/global/custom_text_poppins.dart';
import 'package:match_up/core/utils/color.dart';
import 'package:match_up/core/utils/image.dart';

class MatchCardToday extends StatelessWidget {
  const MatchCardToday({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: Colors.transparent,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomTextPopins(
          text: "Today",
          fontWeight: FontWeight.w600,
          size: 18.sp,
          color: AppColor.blackborder,
        ),
        SizedBox(height: 10.h),
        Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.r),
                  topRight: Radius.circular(4.r)),
              color: AppColor.greyWhite,
              image: DecorationImage(
                  image: AssetImage(ImagePath.shape), fit: BoxFit.contain)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextPopins(
                text: "CHICAGO\nCUBS",
                fontWeight: FontWeight.w600,
                size: 12.sp,
                color: AppColor.blackborder,
              ),
              Image.asset(
                ImagePath.team1,
                height: 44.h,
                width: 44.w,
              ),
              SizedBox(height: 5.h),
              Image.asset(
                ImagePath.vs,
                height: 16.h,
                width: 16.w,
              ),
              Image.asset(
                ImagePath.team4,
                height: 44.h,
                width: 44.w,
              ),
              CustomTextPopins(
                text: "BOSTON \nRED SOX",
                fontWeight: FontWeight.w600,
                size: 12.sp,
                color: AppColor.blackborder,
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(4.r),
                bottomRight: Radius.circular(4.r),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextPopins(
                  text: 'Today',
                  fontWeight: FontWeight.w600,
                  size: 14.sp,
                  color: AppColor.white),
              CustomTextPopins(
                  text: '04.30 PM',
                  fontWeight: FontWeight.w600,
                  size: 14.sp,
                  color: AppColor.white),
            ],
          ),
        )
      ]),
    );
  }
}
