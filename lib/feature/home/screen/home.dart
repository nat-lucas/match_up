import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match_up/core/global/custom_text_poppins.dart';
import 'package:match_up/core/utils/color.dart';
import 'package:match_up/core/utils/image.dart';
import 'package:match_up/feature/home/widget/match_card_today.dart';
import 'package:match_up/feature/home/widget/match_card_tomorrow.dart';
import 'package:match_up/feature/home/widget/team_card.dart';
import 'package:match_up/feature/select_sport/controller/sport_controller.dart';

import '../../../core/route/route.dart';

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
          text: 'Matches',
          fontWeight: FontWeight.w600,
          size: 24.sp,
          color: AppColor.blackborder,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.r),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(Approute.livescore);
              },
              child: Image.asset(
                ImagePath.scoor,
                fit: BoxFit.contain,
                height: 32.h,
                width: 109.w,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: 150.h,
                  width: double.infinity,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 15.w);
                    },
                    itemCount: sportController.selectedTeams.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var item = sportController.selectedTeams[index];
                      return TeramCard(
                        image: item['logo'] ?? "",
                        text: item['name'] ?? "",
                      );
                    },
                  )),
          
              CustomTextPopins(
                text: 'Upcoming Matches',
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
              SizedBox(height: 10.h),
              MatchCardToday(),
              SizedBox(height: 10.h),
              MatchCardTomorrow(),
              SizedBox(height: 10.h),
              MatchCardTomorrow(),
            ],
          )),
        ),
      ),
    );
  }
}
