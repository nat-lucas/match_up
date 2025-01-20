import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match_up/core/global/custom_button.dart';
import 'package:match_up/feature/select_sport/controller/sport_controller.dart';
import 'package:match_up/feature/select_sport/widget/card.dart';
import '../../../core/global/custom_text_poppins.dart';
import '../../../core/route/route.dart';
import '../../../core/utils/color.dart';

class ChooseSport extends StatelessWidget {
  const ChooseSport({super.key});

  @override
  Widget build(BuildContext context) {
    final sportController = Get.find<SportController>();
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      appBar: AppBar(
        backgroundColor: Color(0xffFAFAFA),
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: CustomTextPopins(
          text: "Choose Teams",
          fontWeight: FontWeight.w600,
          size: 24.sp,
          color: AppColor.blackborder,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: sportController.sport.length,
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10.r,
                  mainAxisSpacing: 10.r,
                  childAspectRatio: 1.2,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  var data = sportController.sport[index];
                  return Obx(() => GestureDetector(
                        onTap: () => sportController.selectSport(index),
                        child: SportCard(
                          image: data['image'],
                          title: data['name'],
                          isSelected:
                              sportController.selectedIndex.value == index,
                        ),
                      ));
                },
              ),
            ),
            SizedBox(height: 20.h),
            CustomButton(
              text: "Next",
              ontap: () {
                Get.toNamed(Approute.selectTeam);
              },
            ),
          ],
        ),
      ),
    );
  }
}
