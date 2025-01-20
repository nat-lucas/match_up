import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/global/custom_text_poppins.dart';
import '../../../core/utils/color.dart';

class CustomExpansionTile extends StatelessWidget {
  final String title;
  final List<String> items;
  final List<int> selectedIndices;
  final Function(int index) onItemSelected;

  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.items,
    required this.selectedIndices,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColor.greyWhite,
        ),
      ),
      child: ExpansionTile(
        collapsedShape: const RoundedRectangleBorder(),
        shape: const RoundedRectangleBorder(),
        title: CustomTextPopins(
          text: title,
          size: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColor.blackborder,
        ),
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Obx(() {
                final isSelected = selectedIndices.contains(index);
                return ListTile(
                  title: CustomTextPopins(
                    text: items[index],
                    size: 14.sp,
                    color: AppColor.blackborder,
                  ),
                  trailing: Radio<bool>(
                    activeColor: AppColor.primaryColor,
                    value: true,
                    groupValue: isSelected,
                    onChanged: (bool? value) {
                      onItemSelected(index);
                    },
                  ),
                  onTap: () {
                    onItemSelected(index);
                  },
                );
              });
            },
          ),
        ],
      ),
    );
  }
}
