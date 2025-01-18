import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match_up/core/global/custom_button.dart';
import 'package:match_up/core/global/custom_text_poppins.dart';
import 'package:match_up/core/route/route.dart';
import 'package:match_up/core/utils/color.dart';
import 'package:match_up/feature/subcription/widget/plan_card.dart';

import '../controller/subcription_controller.dart';

class Subcription extends StatelessWidget {
  const Subcription({super.key});

  @override
  Widget build(BuildContext context) {
    final SubscriptionController subcriptionController =
        Get.find<SubscriptionController>();

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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.r),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextPopins(
                    text: "Starter Plan",
                    fontWeight: FontWeight.w500,
                    size: 20,
                    color: AppColor.blackborder,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: subcriptionController.plan.length,
                    itemBuilder: (context, index) {
                      return PlanCard(
                        title: subcriptionController.plan[index]['name'],
                        subtitle: subcriptionController.plan[index]['sub'],
                        isvale: subcriptionController.selectedPlan == index,
                        ontap: () => subcriptionController.selectPlan(index),
                      );
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.32,
                  ),
                  CustomButton(
                    text: subcriptionController.buttonText.value,
                    ontap: () {
                      if (subcriptionController.selectedPlan == 1) {
                        subcriptionController.makePayment(0.99);
                      } else {
                        Get.toNamed(Approute.chose);
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
