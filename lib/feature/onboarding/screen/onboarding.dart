import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match_up/core/global/custom_button.dart';
import 'package:match_up/core/global/custom_text_poppins.dart';
import 'package:match_up/core/routes/route.dart';
import 'package:match_up/feature/onboarding/widget/onboard_gridview.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFE8E8),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OnboardGridview(),
              CustomTextPopins(
                text:
                    "Follow All of Your\nFavorite Sports Teams\nin One Place!",
                fontWeight: FontWeight.w700,
                size: 28.sp,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.r,
              ),
              CustomButton(
                text: "Sign in",
                ontap: () {
                  debugPrint("========>>cliked");
                  Get.offNamed(Approute.login);
                },
              ),
              SizedBox(
                height: 10.r,
              ),
              CustomButton(
                ontap: () {
                  debugPrint("========>>cliked");
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
