import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match_up/core/global/custom_button.dart';
import 'package:match_up/core/global/custom_text_poppins.dart';
import 'package:match_up/core/utils/color.dart';
import 'package:match_up/feature/subcription/widget/plan_card.dart';

import '../controller/subcription_controller.dart';

class Subcription2 extends StatelessWidget {
  const Subcription2({super.key});

  @override
  Widget build(BuildContext context) {
    final subcriptionController = Get.find<SubscriptionController>();
    

    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          centerTitle: true,
          title: CustomTextPopins(
            text: "Subscription",
            fontWeight: FontWeight.w600,
            size: 24.sp,
            color: AppColor.blackborder,
          ),
        ),
        body: Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextPopins(
                  text: "Upgrade Plan",
                  fontWeight: FontWeight.w500,
                  size: 20,
                  color: AppColor.blackborder,
                ),
                SizedBox(
                  height: 10.h,
                ),
                PlanCard(
                  title: "Premium Version",
                  subtitle:
                      "You can pick an unlimited amount\n of teams in any sport to follow",
                  price: true,
                  isvale: true,
                  ontap: () {},
                ),
                Spacer(),
                CustomButton(
                  text: "Buy Plan",
                  ontap: () {
                    subcriptionController.makePayment(0.99);
                  },
                ),
                SizedBox(
                  height: 20.h,
                )
              ],
            )));
  }
}
