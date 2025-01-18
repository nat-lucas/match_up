import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/global/custom_text_poppins.dart';
import '../../../core/utils/color.dart';
import '../controller/sport_controller.dart';

class SelectTeam extends StatelessWidget {
  const SelectTeam({super.key});

  @override
  Widget build(BuildContext context) {
    final sportcontroller = Get.find<SportController>();
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      appBar: AppBar(
        backgroundColor: Color(0xffFAFAFA),
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: CustomTextPopins(
          text: "Choose Sports",
          fontWeight: FontWeight.w600,
          size: 24.sp,
          color: AppColor.blackborder,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  sportcontroller.selectedimage.value,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10.h),
                CustomTextPopins(
                  text: sportcontroller.selectedSport.value,
                  fontWeight: FontWeight.w600,
                  size: 24.sp,
                  color: AppColor.blackborder,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
