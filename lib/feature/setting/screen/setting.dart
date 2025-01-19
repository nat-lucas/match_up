import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/global/custom_text_poppins.dart';
import '../../../core/utils/color.dart';
import '../../../core/utils/image.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: CustomTextPopins(
          text: "Settings",
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
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40.h,
                      backgroundImage: AssetImage(ImagePath.profile),
                      backgroundColor: AppColor.greyWhite,
                    )
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
