import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match_up/core/utils/color.dart';
import 'package:match_up/core/utils/image.dart';
import 'package:match_up/feature/home/screen/home.dart';
import 'package:match_up/feature/nav_bar/controller/navcontroller.dart';
import 'package:match_up/feature/setting/screen/setting.dart';
import 'package:match_up/feature/highlight/screen/highlight.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key});

  final navController = Get.find<NavController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (navController.currentIndex.value) {
          case 0:
            return Home();
          case 1:
            return Highlight();
          case 2:
            return Setting();
          default:
            return Center(child: Text("Home"));
        }
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          backgroundColor: AppColor.white,
          currentIndex: navController.currentIndex.value,
          selectedFontSize: 12.sp,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColor.primaryColor,
          unselectedFontSize: 12.sp,
          onTap: (index) {
            navController.updateIndex(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(ImagePath.home,
                  height: 24.w,
                  width: 24.w,
                  color: navController.currentIndex.value == 0
                      ? AppColor.primaryColor
                      : null),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(ImagePath.sprend,
                  height: 24.w,
                  width: 24.w,
                  color: navController.currentIndex.value == 1
                      ? AppColor.primaryColor
                      : null),
              label: "Highlights",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(ImagePath.setting,
                  height: 24.w,
                  width: 24.w,
                  color: navController.currentIndex.value == 2
                      ? AppColor.primaryColor
                      : null),
              label: "Settings",
            ),
          ],
        );
      }),
    );
  }
}
