import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match_up/core/global/custom_button.dart';
import 'package:match_up/core/global/custom_dialog.dart';
import 'package:match_up/core/route/route.dart';
import 'package:match_up/feature/auth/controller/auth_controller.dart';
import 'package:match_up/feature/setting/widget/custom_list_tile.dart';
import '../../../core/global/custom_text_poppins.dart';
import '../../../core/utils/color.dart';
import '../../../core/utils/image.dart';
import '../controller/setting_controller.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    final settingcontroller = Get.find<SettingController>();
    final authcontroller = Get.find<AuthController>();
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => ListTile(
                      contentPadding: EdgeInsets.all(0),
                      leading: CircleAvatar(
                        radius: 25.h,
                        backgroundImage: settingcontroller
                                    .selectedImage.value !=
                                null
                            ? FileImage(settingcontroller.selectedImage.value!)
                            : AssetImage(ImagePath.profile),
                        backgroundColor: AppColor.greyWhite,
                      ),
                      title: CustomTextPopins(
                        text: settingcontroller.userData['name'] ?? "Unknown",
                        fontWeight: FontWeight.w500,
                        size: 18.sp,
                        color: AppColor.blackborder,
                      ),
                      subtitle: CustomTextPopins(
                        textOverflow: TextOverflow.ellipsis,
                        text:
                            authcontroller.auth.currentUser?.email ?? "Unknown",
                        fontWeight: FontWeight.w400,
                        size: 14.sp,
                        color: Color(0xff8E8E8E),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          Get.toNamed(Approute.personalinfo);
                        },
                        icon: Image.asset(
                          ImagePath.edit,
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                    )),
                SizedBox(height: 10.h),
                CustomTextPopins(
                  text: "Setting",
                  fontWeight: FontWeight.w500,
                  size: 16.sp,
                  color: Color(0xff636F85),
                ),
                CustomListTile(
                    onTap: () {
                      Get.toNamed(Approute.editTeam);
                    },
                    image: ImagePath.team,
                    tittle: "Edit Team",
                    trailing: false),
                Obx(
                  () => CustomListTile(
                    image: ImagePath.live,
                    tittle: "Live Score",
                    isbool: true,
                    onSwitchChanged: (value) {
                      settingcontroller.toggleSwitch(value);
                    },
                    trailing: settingcontroller.isSwitchOn.value,
                  ),
                ),
                CustomListTile(
                    onTap: () {
                      Get.toNamed(Approute.subcription,
                          arguments: {"inUser": true});
                    },
                    image: ImagePath.payment,
                    tittle: "Subcription",
                    trailing: false),
                CustomListTile(
                    onTap: () {
                      Get.toNamed(Approute.policies);
                    },
                    image: ImagePath.polyci,
                    tittle: "Legat & Policy",
                    trailing: false),
                CustomListTile(
                    onTap: () {
                      Get.toNamed(Approute.help);
                    },
                    image: ImagePath.help,
                    tittle: "Help and Support",
                    trailing: false),
                CustomListTile(
                    onTap: () {
                      CustomDialog.show(
                        title: "Sign Out",
                        message: "Are Your Sure ?",
                        onYes: () {
                          settingcontroller.logout();
                          Get.back();
                          Get.offAllNamed(Approute.onboarding);
                        },
                      );
                    },
                    image: ImagePath.exit,
                    iscolor: true,
                    tittle: "Sing Out",
                    trailing: false),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                  text: "Contact Us",
                  ontap: () {
                    Get.toNamed(Approute.contactUs);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
