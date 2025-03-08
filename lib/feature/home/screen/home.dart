import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match_up/core/global/custom_text_poppins.dart';
import 'package:match_up/core/global/loading.dart';
import 'package:match_up/core/route/route.dart';
import 'package:match_up/core/utils/color.dart';
import 'package:match_up/feature/home/widget/match_card_today.dart';
import 'package:match_up/feature/home/widget/team_card.dart';
import 'package:match_up/feature/select_sport/controller/sport_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final sportController = Get.find<SportController>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        scrolledUnderElevation: 0,
        title: CustomTextPopins(
          text: 'Your Teams',
          fontWeight: FontWeight.w600,
          size: 24.sp,
          color: AppColor.blackborder,
        ),
        // actions: [
        //   Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 10.r),
        //     child: GestureDetector(
        //       onTap: () {
        //         Get.toNamed(Approute.livescore);
        //       },
        //       child: Image.asset(
        //         ImagePath.scoor,
        //         fit: BoxFit.contain,
        //         height: 32.h,
        //         width: 109.w,
        //       ),
        //     ),
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => SizedBox(
                  height: sportController.height.value,
                  width: double.infinity,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 15.w);
                    },
                    itemCount: sportController.selectedTeams.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var item = sportController.selectedTeams[index];
                      return GestureDetector(
                        onTap: () {
                          debugPrint("Team ID: ${item['id']}");
                          sportController.getNext5event(item['id'] as String);
                        },
                        child: TeramCard(
                          image: item['logo'] ?? "",
                          text: item['name'] ?? "",
                        ),
                      );
                    },
                  ))),
              CustomTextPopins(
                text: 'Upcoming Games',
                fontWeight: FontWeight.w600,
                size: 16.sp,
                color: AppColor.blackborder,
              ),
              SizedBox(height: 10.h),
              Divider(
                color: AppColor.greyWhite,
                height: 1.h,
                thickness: 1.h,
              ),
              SizedBox(
                height: 15.h,
              ),
              Obx(() => sportController.isLoading.value
                  ? Center(
                      child: LoadingWidget(
                        color: AppColor.primaryColor,
                      ),
                    )
                  : ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: sportController.scheduleList.length,
                      itemBuilder: (context, index) {
                        var data = sportController.scheduleList[index];
                        return GestureDetector(
                          onTap: () {
                            if (index == 0) {
                              Get.toNamed(Approute.livescore);
                            }
                          },
                          child: MatchCardToday(
                            evenTime: data.strTime ?? "",
                            eventDate: data.dateEvent ?? "",
                            date: data.dateEventLocal ?? "",
                            team1: data.strHomeTeam ?? "",
                            team2: data.strAwayTeam ?? "",
                            team1logo: data.strHomeTeamBadge ?? "",
                            teamlogo2: data.strAwayTeamBadge ?? "",
                            time: data.strTimeLocal ?? "",
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 15.h,
                        );
                      },
                    ))
            ],
          )),
        ),
      ),
    );
  }
}
