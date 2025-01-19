import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match_up/core/global/custom_button.dart';
import 'package:match_up/core/global/custom_text_poppins.dart';
import 'package:match_up/core/global/custom_textfeild.dart';

import '../../../core/utils/color.dart';
import '../../../core/utils/image.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: CustomTextPopins(
          text: "Personal info",
          fontWeight: FontWeight.w600,
          size: 24.sp,
          color: AppColor.blackborder,
        ),
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 45.h,
                    backgroundColor: AppColor.greyWhite,
                    backgroundImage: AssetImage(ImagePath.profile),
                  ),
                  SizedBox(height: 10.h),
                  CustomTextPopins(
                    decoration: TextDecoration.underline,
                    text: "Change image",
                    fontWeight: FontWeight.w500,
                    size: 14.sp,
                    color: AppColor.primaryColor,
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFeild(hint: "phorent", tittle: "Username"),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextFeild(
                      fillColor: Color(0xffEDEEF4),
                      hint: "phorent@gamil.com",
                      tittle: "Email"),
                ],
              ),
              CustomButton(
                text: "Save Changes",
                ontap: () {
                  Get.back();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
