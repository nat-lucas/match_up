import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match_up/core/global/custom_text_poppins.dart';
import 'package:match_up/feature/setting/controller/setting_controller.dart';
import '../../../core/utils/color.dart';

class CustomExpansionTileText extends StatelessWidget {
  final String title;
  final String content;
  final int index;

  const CustomExpansionTileText(
      {super.key,
      required this.title,
      required this.content,
      required this.index});

  @override
  Widget build(BuildContext context) {
    final SettingController controller = Get.find();

    return Obx(() {
      bool isExpanded = controller.expandedIndex.value == index;

      return ExpansionTile(
        collapsedShape: const RoundedRectangleBorder(),
        shape: const RoundedRectangleBorder(),
        childrenPadding: EdgeInsets.all(0.r),
        title: CustomTextPopins(
          text: title,
          fontWeight: FontWeight.w600,
          size: 14.sp,
          color: isExpanded ? Colors.red : AppColor.blackborder,
        ),
        onExpansionChanged: (expanded) {
          if (expanded) {
            controller.expandedIndex.value = index;
          } else {
            controller.expandedIndex.value = -1;
          }
        },
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextPopins(
              text: content,
              fontWeight: FontWeight.w400,
              size: 14.sp,
              color: AppColor.blackborder,
            ),
          ),
        ],
      );
    });
  }
}
