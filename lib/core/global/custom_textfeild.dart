import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:match_up/core/global/custom_text_poppins.dart';
import 'package:match_up/core/utils/color.dart';

class CustomTextFeild extends StatelessWidget {
  final String hint;
  final String tittle;
  final Color? fillColor;
  final Widget? suffix;
  final bool? obsecure;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextFeild(
      {super.key,
      required this.hint,
      required this.tittle,
      this.obsecure,
      this.validator,
      this.controller,  this.suffix, this.fillColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomTextPopins(
              text: tittle,
              size: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColor.black,
            ),
          ],
        ),
        SizedBox(
          height: 5.h,
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obsecure ?? false,
          cursorHeight: 20.h,
          
          cursorColor: AppColor.blackborder,
          
          style: GoogleFonts.inter(
              color: AppColor.blackborder,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(12.r),
            filled: true,
            fillColor: fillColor ??  AppColor.white,
            hintText: hint,
            errorStyle: GoogleFonts.inter(
                color: Colors.red[700],
                fontSize: 12.sp,
                fontWeight: FontWeight.w400),
            hintStyle: GoogleFonts.poppins(
                color: AppColor.blackborder,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
                suffixIcon: suffix,
                

            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: AppColor.greyWhite, width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: AppColor.greyWhite, width: 1)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: AppColor.greyWhite, width: 1)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: AppColor.greyWhite, width: 1)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: AppColor.greyWhite, width: 1)),
          ),
        )
      ],
    );
  }
}
