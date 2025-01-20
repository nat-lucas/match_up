import 'package:get/get.dart';
import 'package:match_up/core/utils/image.dart';

import '../../setting/controller/setting_controller.dart';

class SportController extends GetxController {
  final settingController = Get.find<SettingController>();
  var selectedSport = "".obs;
  var selectedimage = "".obs;
  var allowMultipleSelection = false.obs;
  var selectedTeamIndices = <int>[].obs;

  final List sport = [
    {
      "name": "Basketball",
      "image": ImagePath.baseketball,
    },
    {
      "name": "Baseball",
      "image": ImagePath.base,
    },
    {
      "name": "Football",
      "image": ImagePath.football,
    },
    {
      "name": "Hockey",
      "image": ImagePath.hokie,
    }
  ];

  var selectedIndex = (-1).obs;

  void selectSport(int index) {
    if (selectedIndex.value == index) {
      selectedIndex.value = -1;
      selectedSport.value = "";
    } else {
      selectedIndex.value = index;
      selectedSport.value = sport[index]["name"];
      selectedimage.value = sport[index]["image"];
    }
  }
  void toggleTeamSelection(int index) {
    if (allowMultipleSelection.value) {
      if (selectedTeamIndices.contains(index)) {
        selectedTeamIndices.remove(index);
      } else {
        selectedTeamIndices.add(index);
      }
    } else {
      if (selectedTeamIndices.contains(index)) {
        selectedTeamIndices.remove(index);
      } else if (selectedTeamIndices.length < 2) {
        selectedTeamIndices.add(index);
      }
    }
  }
}
