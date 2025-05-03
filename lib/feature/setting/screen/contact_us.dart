import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match_up/core/global/custom_button.dart';
import 'package:match_up/core/global/custom_textfeild.dart';

import '../../../core/global/custom_text_poppins.dart';
import '../../../core/utils/color.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: CustomTextPopins(
          text: "Contact Us",
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
              CustomTextFeild(hint: "phorent", tittle: "Name"),
              SizedBox(
                height: 30.h,
              ),
              CustomTextFeild(
                hint: "Type your issue",
                tittle: "Issue",
                min: 6,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.35,
              ),
              CustomButton(
                text: "Send",
                ontap: () {
                  Get.back();
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
