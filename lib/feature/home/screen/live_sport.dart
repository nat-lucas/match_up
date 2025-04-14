import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:match_up/core/global/loading.dart';
import 'package:match_up/core/utils/image.dart';
import 'package:match_up/feature/home/controller/live_contorller.dart';
import 'package:match_up/feature/home/widget/team_scoor.dart';

import '../../../core/global/custom_text_poppins.dart';
import '../../../core/utils/color.dart';

class LiveSport extends StatelessWidget {
  const LiveSport({super.key});

  @override
  Widget build(BuildContext context) {
    final LiveScoreController liveScoreController =
        Get.put(LiveScoreController());

    var liveData = liveScoreController.liveScores;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: CustomTextPopins(
          text: "Live Score",
          fontWeight: FontWeight.w600,
          size: 24.sp,
          color: AppColor.blackborder,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Lottie.asset(
              "assets/anim/live.json",
              height: 40.h,
              width: 40.w,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(20.r),
            child: Obx(
              () {
                if (liveScoreController.isLoading.value) {
                  return Center(
                    child: LoadingWidget(
                      color: AppColor.primaryColor,
                      size: 30.h,
                    ),
                  );
                } else {
                  return liveScoreController.liveScores.isNotEmpty
                      ? Container(
                          padding: EdgeInsets.all(15.r),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: AppColor.greyWhite,
                              width: 1.5,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // ✅ You can safely access liveData.first here now
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TeamScoor(
                                    image:
                                        liveData.first.strHomeTeamBadge ?? "",
                         
                                    title: liveData.first.strHomeTeam,
                                  ),
                                  Column(
                                    children: [
                                      CustomTextPopins(
                                        text: liveData.first.dateEvent ?? "",
                                        fontWeight: FontWeight.w400,
                                        size: 12.sp,
                                        color: AppColor.blackborder,
                                      ),
                                      CustomTextPopins(
                                        text:
                                            "${liveData.first.intHomeScore.toString()}-${liveData.first.intAwayScore.toString()}",
                                        fontWeight: FontWeight.w700,
                                        size: 27.sp,
                                        color: AppColor.primaryColor,
                                      ),
                                      CustomTextPopins(
                                        text: "${liveData.first.strStatus}",
                                        fontWeight: FontWeight.w400,
                                        size: 12.sp,
                                        color: AppColor.blackborder,
                                      ),
                                    ],
                                  ),
                                  TeamScoor(
                                    image:
                                        liveData.first.strAwayTeamBadge ?? "",
                     
                                    title: liveData.first.strAwayTeam,
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),
                              CustomTextPopins(
                                text: "Match Overview",
                                fontWeight: FontWeight.w500,
                                size: 13.sp,
                                color: AppColor.blackborder,
                              ),
                              SizedBox(height: 5.h),
                              CustomTextPopins(
                                text: "Summary",
                                fontWeight: FontWeight.w400,
                                size: 12.sp,
                                color: AppColor.blackborder,
                              ),
                              SizedBox(height: 10.h),
                              Align(
                                alignment: Alignment.centerRight,
                                child: CustomTextPopins(
                                  text: "R  1  2 3  4  5  6  7  8  9 EI  H E",
                                  fontWeight: FontWeight.w400,
                                  size: 12.sp,
                                  color: AppColor.black,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Divider(
                                color: AppColor.greyWhite,
                                thickness: 1.5,
                                height: 1.h,
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomTextPopins(
                                    text: "CHICAGO CUBS",
                                    fontWeight: FontWeight.w500,
                                    size: 10.sp,
                                    color: AppColor.black,
                                  ),
                                  Image.asset(
                                    ImagePath.basebol,
                                    height: 13.h,
                                    width: 13.w,
                                  ),
                                  CustomTextPopins(
                                    text: "4",
                                    fontWeight: FontWeight.w400,
                                    size: 12.sp,
                                    color: AppColor.primaryColor,
                                  ),
                                  CustomTextPopins(
                                    text: "1  0  0  0  0  0  0  1  1   9 0",
                                    fontWeight: FontWeight.w400,
                                    size: 12.sp,
                                    color: AppColor.black,
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomTextPopins(
                                    text: "BOSTON RED SOX",
                                    fontWeight: FontWeight.w500,
                                    size: 10.sp,
                                    color: AppColor.black,
                                  ),
                                  Image.asset(
                                    ImagePath.bol,
                                    height: 13.h,
                                    width: 13.w,
                                  ),
                                  CustomTextPopins(
                                    text: "1",
                                    fontWeight: FontWeight.w400,
                                    size: 12.sp,
                                    color: AppColor.primaryColor,
                                  ),
                                  CustomTextPopins(
                                    text: "0  0  0  0  0  0  0  1  0   3 1",
                                    fontWeight: FontWeight.w400,
                                    size: 12.sp,
                                    color: AppColor.black,
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      : Center(
                          child: CustomTextPopins(
                            text: "No live match data available.",
                            fontWeight: FontWeight.w500,
                            size: 16.sp,
                            color: AppColor.blackborder,
                          ),
                        );
                }
              },
            )),
      ),
    );
  }
}
