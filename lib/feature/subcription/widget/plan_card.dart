import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match_up/core/global/custom_text_poppins.dart';
import 'package:match_up/core/utils/color.dart';

class PlanCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isvale;
  final bool? price;
  final void Function()? ontap;
  const PlanCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.isvale,
      this.ontap,
      this.price});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child:   Container(
        margin: EdgeInsets.symmetric(vertical: 10.r),
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: isvale ? AppColor.primaryColor : AppColor.greyWhite,
              width: 1.5,
            )),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Container(
            height: 20.h,
            width: 20.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: isvale ? AppColor.primaryColor : AppColor.greyWhite,
                    width: 1.5)),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextPopins(
                text: title,
                fontWeight: FontWeight.w600,
                size: 20.sp,
                color: AppColor.blackborder,
              ),
              price ?? false
                  ? CustomTextPopins(
                      text: "\$0.99",
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                      size: 20.sp,
                      color: AppColor.primaryColor,
                    )
                  : SizedBox()
            ],
          ),
          subtitle: CustomTextPopins(
            text: subtitle,
            fontWeight: FontWeight.w400,
            size: 14.sp,
            color: AppColor.blackborder,
          ),
        ),
      ),
    );
  }
}
