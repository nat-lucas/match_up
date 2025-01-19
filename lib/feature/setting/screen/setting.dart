import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match_up/core/global/custom_button.dart';
import 'package:match_up/core/route/route.dart';
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
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: CircleAvatar(
                    radius: 25.h,
                    backgroundImage: AssetImage(ImagePath.profile),
                    backgroundColor: AppColor.greyWhite,
                  ),
                  title: CustomTextPopins(
                    text: "Phorent",
                    fontWeight: FontWeight.w500,
                    size: 18.sp,
                    color: AppColor.blackborder,
                  ),
                  subtitle: CustomTextPopins(
                    textOverflow: TextOverflow.ellipsis,
                    text: "phorent@gmail.com",
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
                ),
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
                    onTap: () {},
                    image: ImagePath.payment,
                    tittle: "Payment",
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
