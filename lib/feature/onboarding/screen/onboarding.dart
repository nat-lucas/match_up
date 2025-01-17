import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match_up/core/global/custom_button.dart';
import 'package:match_up/core/global/custom_text_poppins.dart';
import 'package:match_up/core/route/route.dart';
import 'package:match_up/feature/onboarding/widget/onboard_gridview.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OnboardGridview(),
              CustomTextPopins(
                text: "Track Your Teams\n Free or Premium\nAccess!",
                fontWeight: FontWeight.w700,
                size: 30.sp,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.r,
              ),
              CustomButton(text: "Sign in",
              ontap: () {
                Get.offNamed(Approute.login);
              },
              ),
              SizedBox(
                height: 10.r,
              ),
              CustomButton(
                ontap: () {
                  Get.offNamed(Approute.singup);
                },
                text: "Sign Up",
                isBorder: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
