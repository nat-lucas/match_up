import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match_up/core/global/custom_button.dart';
import 'package:match_up/core/global/custom_text_poppins.dart';
import 'package:match_up/core/utils/color.dart';
import 'package:match_up/core/utils/image.dart';
import 'package:match_up/feature/select_sport/controller/sport_controller.dart';
import 'package:match_up/feature/subcription/widget/plan_card.dart';

import '../controller/subcription_controller.dart';

class Subcription2 extends StatelessWidget {
  const Subcription2({super.key});

  @override
  Widget build(BuildContext context) {
    final subcriptionController = Get.find<SubscriptionController>();
    final sporController = Get.find<SportController>();
    String formatDateFromString(String dateString) {
      try {
        DateTime date = DateTime.parse(dateString);
        return "${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}";
      } catch (e) {
        return "Invalid date";
      }
    }

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
        body: sporController.allowMultipleSelection.value
            ? Padding(
                padding: EdgeInsets.all(20.r),
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(
                        ImagePath.done,
                        height: 34.h,
                        width: 34.w,
                      ),
                      SizedBox(
                        height: 10.r,
                      ),
                      CustomTextPopins(
                        text: "You have already \n Purchased",
                        fontWeight: FontWeight.w500,
                        size: 20.sp,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30.r,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.r),
                        child: Column(
                          children: [
                            cusTomROW(
                                tittle: "Purchased Date",
                                date: formatDateFromString(
                                    sporController.purchaseDate.value)),
                            SizedBox(
                              height: 5.r,
                            ),
                            cusTomROW(
                                tittle: "Expiry Date          ",
                                date: formatDateFromString(
                                    sporController.expireDate.value)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            : Padding(
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

Widget cusTomROW({required String date, required String tittle}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomTextPopins(
        text: tittle,
        fontWeight: FontWeight.w500,
        size: 16.sp,
        color: Colors.black,
      ),
      CustomTextPopins(
        text: ":",
        fontWeight: FontWeight.w500,
        size: 16.sp,
        color: Colors.black,
      ),
      CustomTextPopins(
        text: date,
        fontWeight: FontWeight.w500,
        size: 16.sp,
        color: AppColor.primaryColor,
      ),
    ],
  );
}
