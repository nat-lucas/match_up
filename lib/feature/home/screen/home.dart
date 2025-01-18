import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:match_up/core/global/custom_text_poppins.dart';
import 'package:match_up/core/utils/color.dart';
import 'package:match_up/core/utils/image.dart';
import 'package:match_up/feature/home/widget/match_card_today.dart';
import 'package:match_up/feature/home/widget/match_card_tomorrow.dart';
import 'package:match_up/feature/home/widget/teram_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final List data = [
      {
        'image': ImagePath.team1,
        'title': 'Chicago\nCubs',
      },
      {
        'image': ImagePath.team2,
        'title': 'Atlanta\nBraves',
      },
      {
        'image': ImagePath.team3,
        'title': 'Baltimore\nOrioles',
      },
    ];
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
            child: Image.asset(
              ImagePath.scoor,
              fit: BoxFit.contain,
              height: 32.h,
              width: 109.w,
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
                  height: 200.h,
                  width: double.infinity,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 15.w);
                    },
                    itemCount: data.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var item = data[index];
                      return TeramCard(
                        image: item['image'],
                        text: item['title'],
                      );
                    },
                  )),
              SizedBox(height: 10.h),
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
