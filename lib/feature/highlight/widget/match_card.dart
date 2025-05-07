import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:match_up/core/global/custom_text_poppins.dart';
import 'package:match_up/core/global/loading.dart';
import 'package:match_up/core/utils/color.dart';
import 'package:match_up/core/utils/image.dart';
import 'package:intl/intl.dart';

class MatchCard2 extends StatelessWidget {
  final String eventDate;
  final String evenTime;
  final String team1;
  final String team2;
  final String team1Scoor;
  final String team2sScoor;
  final String team1logo;
  final String teamlogo2;
  final String time;

  const MatchCard2(
      {super.key,
      required this.team1,
      required this.team2,
      required this.team1logo,
      required this.teamlogo2,
      required this.time,
      required this.eventDate,
      required this.evenTime,
      required this.team1Scoor,
      required this.team2sScoor});

  String checkMatchDate(String dateStr) {
    debugPrint('+++++++++++++++$dateStr');
    try {
      if (dateStr.isEmpty) {
        return eventDate;
      }

      DateTime matchDate = DateFormat('yyyy-MM-dd').parse(dateStr);
      DateTime today = DateTime.now();
      DateTime tomorrow = today.add(Duration(days: 1));

      if (isSameDay(matchDate, today)) {
        return "Today";
      } else if (isSameDay(matchDate, tomorrow)) {
        return "Tomorrow";
      } else {
        return DateFormat('yyyy-MM-dd').format(matchDate);
      }
    } catch (e) {
      return "Invalid Date Format";
    }
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  String formatTeamName(String teamName) {
    int spaceIndex = teamName.indexOf(' ');
    if (spaceIndex != -1) {
      return '${teamName.substring(0, spaceIndex)}\n${teamName.substring(spaceIndex + 1)}';
    }
    return teamName;
  }

  @override
  Widget build(BuildContext context) {
    String formatTimeTo12Hour(String time24) {
      try {
        DateTime dateTime = DateFormat("HH:mm").parse(time24);
        String formatted = DateFormat("h:mm a").format(dateTime);
        return formatted;
      } catch (e) {
        return "Invalid time";
      }
    }

    String matchDateText = checkMatchDate(eventDate);
    String displayTime = time.isNotEmpty ? time : evenTime;
    String teamName = formatTeamName(team1);
    String teamName2 = formatTeamName(team2);
    debugPrint("================$team1logo,===========$teamlogo2");

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: Colors.transparent,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomTextPopins(
          text: matchDateText,
          fontWeight: FontWeight.w600,
          size: 18.sp,
          color: AppColor.blackborder,
        ),
        SizedBox(height: 10.h),
        Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.r),
                  topRight: Radius.circular(4.r)),
              color: AppColor.greyWhite,
              image: DecorationImage(
                  image: AssetImage(ImagePath.shape1), fit: BoxFit.contain)),
          child: Column(
            children: [
              CustomTextPopins(
                text: "$team1Scoor-$team2sScoor",
                fontWeight: FontWeight.w600,
                size: 20.spMin,
                color: AppColor.primaryColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomTextPopins(
                            textOverflow: TextOverflow.ellipsis,
                            text: teamName,
                            fontWeight: FontWeight.w600,
                            size: 12.sp,
                            color: AppColor.blackborder,
                          ),
                        ),
                        CachedNetworkImage(
                          imageUrl: team1logo,
                          height: 44.h,
                          width: 44.w,
                          placeholder: (context, url) => LoadingWidget(
                            color: AppColor.primaryColor,
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Image.asset(
                    ImagePath.vs,
                    height: 16.h,
                    width: 16.w,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CachedNetworkImage(
                          imageUrl: teamlogo2,
                          height: 44.h,
                          width: 44.w,
                          placeholder: (context, url) => LoadingWidget(
                            color: AppColor.primaryColor,
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: CustomTextPopins(
                            textOverflow: TextOverflow.ellipsis,
                            text: teamName2,
                            fontWeight: FontWeight.w600,
                            size: 12.sp,
                            color: AppColor.blackborder,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(4.r),
                bottomRight: Radius.circular(4.r),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextPopins(
                  text: matchDateText,
                  fontWeight: FontWeight.w600,
                  size: 14.sp,
                  color: AppColor.white),
              CustomTextPopins(
                  text: formatTimeTo12Hour(displayTime),
                  fontWeight: FontWeight.w600,
                  textOverflow: TextOverflow.ellipsis,
                  size: 14.sp,
                  color: AppColor.white),
            ],
          ),
        )
      ]),
    );
  }
}
