import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match_up/core/global/custom_button.dart';
import 'package:match_up/feature/nav_bar/controller/navcontroller.dart';
import '../../../core/global/custom_text_poppins.dart';
import '../../../core/routes/route.dart';
import '../../../core/utils/color.dart';
import '../controller/sport_controller.dart';

class SelectTeam extends StatelessWidget {
  const SelectTeam({super.key});

  @override
  Widget build(BuildContext context) {
    final sportController = Get.find<SportController>();
    final navController = Get.find<NavController>();
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      appBar: AppBar(
        backgroundColor: Color(0xffFAFAFA),
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: CustomTextPopins(
          text: "Choose Sports",
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
              children: [
                Image.asset(
                  sportController.selectedimage.value,
                  height: 92.h,
                  width: 92.w,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10.h),
                CustomTextPopins(
                  text: sportController.selectedSport.value,
                  fontWeight: FontWeight.w600,
                  size: 24.sp,
                  color: AppColor.blackborder,
                ),
                SizedBox(height: 10.h),
                Container(
                  padding: EdgeInsets.all(5.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: AppColor.greyWhite,
                    ),
                  ),
                  child: ExpansionTile(
                    collapsedShape: RoundedRectangleBorder(),
                    shape: RoundedRectangleBorder(),
                    title: CustomTextPopins(
                      text: "Selected Teams",
                      size: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.blackborder,
                    ),
                    children: [
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: sportController.teamList.length,
                        itemBuilder: (context, index) {
                          return Obx(() {
                            final isSelected = sportController
                                .selectedTeamIndices
                                .contains(index);

                            var data = sportController.teamList[index];
                            return ListTile(
                              title: CustomTextPopins(
                                text: data.strTeam,
                                size: 14.sp,
                                color: AppColor.blackborder,
                              ),
                              trailing: Radio<bool>(
                                activeColor: AppColor.primaryColor,
                                value: true,
                                groupValue: isSelected,
                                onChanged: (bool? value) {
                                  sportController.toggleTeamSelection(index);
                                },
                              ),
                              onTap: () {
                                sportController.toggleTeamSelection(index);
                              },
                            );
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60.h,
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.9,
        height: 60.h,
        child: CustomButton(
          ontap: () {
            sportController.getFirestoreSelection();
            navController.currentIndex.value = 0;
            Get.offAllNamed(Approute.navbar);
          },
          text: "Next",
        ),
      ),
    );
  }
}
