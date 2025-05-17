import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match_up/feature/highlight/controller/controller.dart';
import 'package:match_up/feature/highlight/widget/match_card.dart';

import '../../../core/global/custom_text_poppins.dart';
import '../../../core/global/loading.dart';
import '../../../core/utils/color.dart';

class Highlight extends StatelessWidget {
  const Highlight({super.key});

  @override
  Widget build(BuildContext context) {
    final highlightController = Get.find<HighlightController>();
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: GestureDetector(
          onTap: () {},
          child: CustomTextPopins(
            text: "Highlights",
            fontWeight: FontWeight.w600,
            size: 24.sp,
            color: AppColor.blackborder,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Column(
            spacing: 20.h,
            children: [
              Obx(() => highlightController.isLoading.value
                  ? Center(
                      child: LoadingWidget(
                        color: AppColor.primaryColor,
                      ),
                    )
                  : highlightController.highlight.isEmpty
                      ? Center(
                          child: CustomTextPopins(
                            text: "No  Highlight Founds",
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            size: 18.sp,
                          ),
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: highlightController.highlight.length,
                          itemBuilder: (context, index) {
                            var data = highlightController.highlight[index];

                            bool isTodayMatch = false;

                            return GestureDetector(
                              onTap: () {
                                debugPrint("=====Today---====$isTodayMatch");
                              },
                              child: MatchCard2(
                                videoUrl: data.strVideo ?? "",
                                evenTime: data.strTime ?? "",
                                eventDate: data.dateEvent ?? "",
                                team1: data.strHomeTeam ?? "",
                                team1logo: data.strHomeTeamBadge ?? "",
                                team2: data.strAwayTeam ?? "",
                                teamlogo2: data.strAwayTeamBadge ?? "",
                                time: "",
                                team1Scoor: data.intAwayScore ?? "0",
                                team2sScoor: data.intHomeScore ?? "",
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 15.h);
                          },
                        ))
            ],
          ),
        ),
      ),
    );
  }
}
