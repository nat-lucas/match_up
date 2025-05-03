import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match_up/core/global/custom_button.dart';
import 'package:match_up/core/global/custom_text_poppins.dart';
import 'package:match_up/core/global/custom_textfeild.dart';
import 'package:match_up/core/global/loading.dart';
import 'package:match_up/core/utils/color.dart';
import 'package:match_up/core/validator/validator.dart';
import 'package:match_up/feature/auth/controller/auth_controller.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final authcontroller = Get.find<AuthController>();
    final fromkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColor.blackborder,
              size: 30,
            )),
      ),
      body: Form(
        key: fromkey,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 1,
            width: MediaQuery.sizeOf(context).width * 1,
            child: Padding(
              padding: EdgeInsets.only(
                  top: 20.r, right: 20.r, left: 20.r, bottom: 20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextPopins(
                        text: "Verify Email",
                        fontWeight: FontWeight.w600,
                        size: 24.sp,
                        color: AppColor.blackborder,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomTextPopins(
                        text:
                            "Enter the email associated with your account and we’ll send an email with instructions to reset your password.",
                        fontWeight: FontWeight.w400,
                        size: 14.sp,
                        color: AppColor.blackborder,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Column(
                    children: [
                      CustomTextFeild(
                          controller: authcontroller.forgot,
                          validator: validateEmail,
                          hint: "example@gmail.com",
                          tittle: "Email"),
                      SizedBox(
                        height: 20.h,
                      ),
                      Obx(() => authcontroller.isLoading.value
                          ? Center(
                              child: LoadingWidget(
                                color: AppColor.primaryColor,
                              ),
                            )
                          : CustomButton(
                              text: "Send",
                              ontap: () {
                                if (fromkey.currentState!.validate()) {
                                  authcontroller.resetPassword();
                                }
                              },
                            ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
