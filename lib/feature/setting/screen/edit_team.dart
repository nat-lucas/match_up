import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:match_up/core/const/const.dart';
import 'package:match_up/core/global/custom_button.dart';
import 'package:match_up/core/global/custom_text_poppins.dart';
import 'package:match_up/feature/setting/controller/edit_team_controller.dart';
import 'package:match_up/feature/setting/widget/cusom_expansiontile.dart';
import '../../../core/utils/color.dart';

class EditTeam extends StatelessWidget {
  const EditTeam({super.key});

  @override
  Widget build(BuildContext context) {
    final editTeamController = Get.find<EditTeamController>();

    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          centerTitle: true,
          title: CustomTextPopins(
            text: "Edit Teams",
            fontWeight: FontWeight.w600,
            size: 24.sp,
            color: AppColor.blackborder,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              spacing: 20.r,
              children: [
                CustomExpansionTile(
                  title: "Baseball",
                  items: Const.baseballTeams,
                  selectedIndices: editTeamController.selectedTeamIndices,
                  onItemSelected: (index) {
                    editTeamController.toggleTeamSelection(index);
                  },
                ),
                CustomExpansionTile(
                  title: "Basketball",
                  items: Const.basketballTeams,
                  selectedIndices: editTeamController.selectedTeamIndices,
                  onItemSelected: (index) {
                    editTeamController.toggleTeamSelection(index);
                  },
                ),
                CustomExpansionTile(
                  title: "Football",
                  items: Const.footballTeams,
                  selectedIndices: editTeamController.selectedTeamIndices,
                  onItemSelected: (index) {
                    editTeamController.toggleTeamSelection(index);
                  },
                ),
                CustomExpansionTile(
                  title: "Hockey",
                  items: Const.hockeyTeams,
                  selectedIndices: editTeamController.selectedTeamIndices,
                  onItemSelected: (index) {
                    editTeamController.toggleTeamSelection(index);
                  },
                ),
                SizedBox(
                  height: 60.h,
                )
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.9,
          height: 60.h,
          child: CustomButton(
            ontap: () {
              Get.back();
            },
            text: "Save Teams",
          ),
        ));
  }
}
