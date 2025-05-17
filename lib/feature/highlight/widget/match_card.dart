import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match_up/core/global/custom_text_poppins.dart';
import 'package:match_up/core/global/loading.dart';
import 'package:match_up/core/utils/color.dart';
import 'package:match_up/core/utils/image.dart';
import 'package:intl/intl.dart';
import 'package:match_up/feature/highlight/controller/video_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
  final String videoUrl;

  const MatchCard2({
    super.key,
    required this.team1,
    required this.team2,
    required this.team1logo,
    required this.teamlogo2,
    required this.time,
    required this.eventDate,
    required this.evenTime,
    required this.team1Scoor,
    required this.team2sScoor,
    required this.videoUrl,
  });

  String checkMatchDate(String dateStr) {
    try {
      if (dateStr.isEmpty) return eventDate;

      DateTime matchDate = DateFormat('yyyy-MM-dd').parse(dateStr);
      DateTime today = DateTime.now();
      DateTime tomorrow = today.add(const Duration(days: 1));

      if (isSameDay(matchDate, today)) return "Today";
      if (isSameDay(matchDate, tomorrow)) return "Tomorrow";
      return DateFormat('yyyy-MM-dd').format(matchDate);
    } catch (_) {
      return "Invalid Date Format";
    }
  }

  bool isSameDay(DateTime d1, DateTime d2) =>
      d1.year == d2.year && d1.month == d2.month && d1.day == d2.day;

  String formatTeamName(String name) {
    int space = name.indexOf(' ');
    if (space != -1) return '${name.substring(0, space)}\n${name.substring(space + 1)}';
    return name;
  }

  String formatTimeTo12Hour(String t) {
    try {
      DateTime dt = DateFormat("HH:mm").parse(t);
      return DateFormat("h:mm a").format(dt);
    } catch (_) {
      return "Invalid Time";
    }
  }

  @override
  Widget build(BuildContext context) {
    final videoController = Get.find<MatchVideoController>();
    String matchDateText = checkMatchDate(eventDate);
    String displayTime = time.isNotEmpty ? time : evenTime;
    String teamName1 = formatTeamName(team1);
    String teamName2 = formatTeamName(team2);
    String? videoId = YoutubePlayer.convertUrlToId(videoUrl);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: Colors.transparent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Video Section
          Container(
            width: double.infinity,
            height: 200.h,
            color: Colors.black,
            child: Obx(() {
              if (!videoController.isCurrentVideo(videoUrl)) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    if (videoId != null)
                      CachedNetworkImage(
                        imageUrl: 'https://img.youtube.com/vi/$videoId/0.jpg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        placeholder: (_, __) => const Center(child: CircularProgressIndicator()),
                        errorWidget: (_, __, ___) => const Icon(Icons.error),
                      ),
                    IconButton(
                      icon: const Icon(Icons.play_circle_fill, size: 64, color: Colors.white),
                      onPressed: () {
                        videoController.initialize(videoUrl);
                      },
                    ),
                  ],
                );
              } else {
                if (videoController.youtubeController != null) {
                  return YoutubePlayer(
                    controller: videoController.youtubeController!,
                    showVideoProgressIndicator: true,
                    progressColors: const ProgressBarColors(
                      playedColor: Colors.red,
                      handleColor: Colors.redAccent,
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }
            }),
          ),

          // Match Info Section
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.r),
                topRight: Radius.circular(4.r),
              ),
              color: AppColor.greyWhite,
              image: DecorationImage(
                image: AssetImage(ImagePath.shape1),
                fit: BoxFit.contain,
              ),
            ),
            child: Column(
              children: [
                CustomTextPopins(
                  text: "$team1Scoor - $team2sScoor",
                  fontWeight: FontWeight.w600,
                  size: 20.spMin,
                  color: AppColor.primaryColor,
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Team 1
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomTextPopins(
                              text: teamName2,
                              textOverflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w600,
                              size: 12.sp,
                              color: AppColor.blackborder,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          CachedNetworkImage(
                            imageUrl: teamlogo2,
                            height: 44.h,
                            width: 44.w,
                            placeholder: (_, __) => LoadingWidget(color: AppColor.primaryColor),
                            errorWidget: (_, __, ___) => const Icon(Icons.error),
                          ),
                        ],
                      ),
                    ),

                    // VS Icon
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Image.asset(
                        ImagePath.vs,
                        height: 16.h,
                        width: 16.w,
                      ),
                    ),

                    // Team 2
                    Expanded(
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: team1logo,
                            height: 44.h,
                            width: 44.w,
                            placeholder: (_, __) => LoadingWidget(color: AppColor.primaryColor),
                            errorWidget: (_, __, ___) => const Icon(Icons.error),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: CustomTextPopins(
                              text: teamName1,
                              textOverflow: TextOverflow.ellipsis,
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

          // Date & Time
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(4.r),
                bottomRight: Radius.circular(4.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextPopins(
                  text: matchDateText,
                  fontWeight: FontWeight.w600,
                  size: 14.sp,
                  color: AppColor.white,
                ),
                CustomTextPopins(
                  text: formatTimeTo12Hour(displayTime),
                  fontWeight: FontWeight.w600,
                  textOverflow: TextOverflow.ellipsis,
                  size: 14.sp,
                  color: AppColor.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
