import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match_up/core/global/custom_button.dart';
import 'package:match_up/core/global/custom_text_poppins.dart';
import 'package:match_up/core/global/custom_textfeild.dart';
import 'package:match_up/core/global/loading.dart';
import '../../../core/utils/color.dart';
import '../controller/setting_controller.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final settingcController = Get.find<SettingController>();
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
                  Obx(() => CircleAvatar(
                      radius: 45.h,
                      backgroundColor: AppColor.greyWhite,
                      backgroundImage: settingcController.selectedImage.value !=
                              null
                          ? FileImage(settingcController.selectedImage.value!)
                          : CachedNetworkImageProvider(
                              settingcController.userData['imageUrl']))),
                  SizedBox(height: 10.h),
                  GestureDetector(
                    onTap: () {
                      settingcController.pickImageForIOS();
                    },
                    child: CustomTextPopins(
                      decoration: TextDecoration.underline,
                      text: "Change image",
                      fontWeight: FontWeight.w500,
                      size: 14.sp,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFeild(
                      controller: settingcController.name,
                      hint: "Name",
                      tittle: "Username"),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextFeild(
                      controller: settingcController.email,
                      fillColor: Color(0xffEDEEF4),
                      hint: "example@gamil.com",
                      tittle: "Email"),
                ],
              ),
              Obx(() => settingcController.isLoading.value
                  ? LoadingWidget(color: AppColor.primaryColor)
                  : CustomButton(
                      text: "Save Changes",
                      ontap: () {
                        settingcController.updateUserData();
                      },
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
