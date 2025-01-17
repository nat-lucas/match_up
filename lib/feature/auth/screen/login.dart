import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:match_up/core/global/custom_button.dart';
import 'package:match_up/core/global/custom_text_poppins.dart';
import 'package:match_up/core/global/custom_textfeild.dart';
import 'package:match_up/core/route/route.dart';
import 'package:match_up/core/utils/color.dart';
import 'package:match_up/core/validator/validator.dart';
import 'package:match_up/feature/auth/controller/auth_controller.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final authcontroller = Get.find<AuthController>();
    final fromkey = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
        key: fromkey,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 1,
            width: MediaQuery.sizeOf(context).width * 1,
            child: Padding(
              padding: EdgeInsets.only(
                  top: 60.r, right: 20.r, left: 20.r, bottom: 20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextPopins(
                        text: "Sign in",
                        fontWeight: FontWeight.w600,
                        size: 24.sp,
                        color: AppColor.blackborder,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomTextPopins(
                        text: "Welcome back, you’ve been missed",
                        fontWeight: FontWeight.w400,
                        size: 14.sp,
                        color: AppColor.blackborder,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CustomTextFeild(
                          validator: validateEmail,
                          hint: "Enter your email address",
                          tittle: "Email Address"),
                      SizedBox(
                        height: 15.h,
                      ),
                      Obx(() => CustomTextFeild(
                          suffix: IconButton(
                              onPressed: () {
                                authcontroller.changeVisible();
                              },
                              icon: authcontroller.visible.value
                                  ? Icon(
                                      Icons.visibility_off_sharp,
                                      color: AppColor.greyWhite,
                                    )
                                  : Icon(
                                      Icons.visibility_rounded,
                                      color: AppColor.greyWhite,
                                    )),
                          obsecure: authcontroller.visible.value,
                          validator: validatePassword,
                          hint: "Enter your password",
                          tittle: "Password")),
                      SizedBox(
                        height: 10.r,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(Approute.forgot);
                          },
                          child: CustomTextPopins(
                            text: "Forgot Password",
                            fontWeight: FontWeight.w400,
                            size: 14.sp,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Obx(() => CustomButton(
                            text: "Sign in",
                            ontap: () {
                              if (fromkey.currentState!.validate()) {
                                authcontroller.login();
                              }
                            },
                          ))
                    ],
                  ),
                  SizedBox(),
                  SizedBox(),
                  SizedBox(),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: "Don’t have an account? ",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: AppColor.blackborder),
                      ),
                      TextSpan(
                        text: "Sing Up ",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: AppColor.primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.offNamed(Approute.singup);
                          },
                      )
                    ])),
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
