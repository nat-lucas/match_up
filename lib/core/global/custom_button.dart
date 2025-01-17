import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:match_up/core/global/custom_text_poppins.dart';
import 'package:match_up/core/utils/color.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? ontap;
  final bool? isBorder;
  const CustomButton(
      {super.key, required this.text, this.ontap, this.isBorder});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15.r),
        decoration: BoxDecoration(
            color: isBorder ?? false ? Colors.transparent : Color(0xffFF5050),
            borderRadius: BorderRadius.circular(12.r),
            border: isBorder ?? false
                ? Border.all(color: AppColor.blackborder, width: 1.5)
                : null),
        child: Center(
          child: CustomTextPopins(
            text: text,
            fontWeight: FontWeight.w600,
            color: isBorder ?? false ? AppColor.blackborder : Colors.white,
            size: 16.sp,
          ),
        ),
      ),
    );
  }
}
