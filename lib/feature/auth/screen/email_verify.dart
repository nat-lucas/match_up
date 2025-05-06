import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match_up/core/global/custom_button.dart';
import 'package:match_up/core/global/custom_text_poppins.dart';
import 'package:match_up/core/global/loading.dart';
import 'package:match_up/core/utils/color.dart';
import 'package:pinput/pinput.dart';

import '../controller/auth_controller.dart';

class EmailVerify extends StatelessWidget {
  const EmailVerify({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.primaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: CustomTextPopins(
          text: "Email Verification",
          fontWeight: FontWeight.w600,
          size: 24.sp,
          color: AppColor.blackborder,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
              ),
              Text(
                'Enter the verification code sent to your email',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.sp,
                ),
              ),
              const SizedBox(height: 24),
              Pinput(
                length: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the code';
                  }
                  if (value.length < 4) {
                    return 'Code must be 4 digits';
                  }
                  return null;
                },
                controller: authController.otp,
                keyboardType: TextInputType.number,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(color: AppColor.primaryColor, width: 2),
                  ),
                ),
                onCompleted: (pin) {
                  debugPrint('Entered PIN: $pin');
                },
              ),
              SizedBox(height: 32.h),
              SizedBox(
                  width: double.infinity,
                  child: Obx(
                    () => authController.isLoading.value
                        ? Center(
                            child: LoadingWidget(
                              color: AppColor.primaryColor,
                            ),
                          )
                        : CustomButton(
                            text: "Verify",
                            ontap: () {
                              authController.verifyOtp();
                            }),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
