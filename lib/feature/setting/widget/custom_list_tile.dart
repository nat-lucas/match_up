import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:match_up/core/global/custom_text_poppins.dart';

import '../../../core/utils/color.dart';

class CustomListTile extends StatelessWidget {
  final String image;
  final String tittle;
  final bool? isbool;
  final bool trailing;
  final VoidCallback? onTap;
  final ValueChanged<bool>? onSwitchChanged;

  const CustomListTile({
    super.key,
    required this.image,
    required this.tittle,
    required this.trailing,
    this.onSwitchChanged, this.onTap, this.isbool,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.r),
      child: Column(
        children: [
          ListTile(
            onTap: onTap,
            contentPadding: EdgeInsets.all(0),
            leading: Image.asset(
              image,
              height: 20.h,
              width: 20.w,
            ),
            title: CustomTextPopins(
              text: tittle,
              fontWeight: FontWeight.w500,
              size: 14.sp,
              color: AppColor.blackborder,
            ),
            trailing: isbool ?? false 
                ? Transform.scale(
                    scale: 0.7,
                    child: Switch(
                      activeTrackColor: AppColor.primaryColor,
                      activeColor: AppColor.white,
                      value: trailing,
                      onChanged: (value) {
                        if (onSwitchChanged != null) {
                          onSwitchChanged!(value);
                        }
                      },
                    ),
                  )
                : null,
          ),
          Divider(
            thickness: 1,
            indent: 40.r,
            color: AppColor.greyWhite,
          ),
        ],
      ),
    );
  }
}
