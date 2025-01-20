import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match_up/core/route/route.dart';
import 'package:match_up/core/utils/image.dart';

import '../../../core/network_caller/service/service.dart';

class SportController extends GetxController {
  var selectedSport = "".obs;
  var selectedimage = "".obs;
  var isLoading = false.obs;
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
  final List<String> teamNames = [
    "Lakers",
    "Warriors",
    "Celtics",
    "Nets",
    "Bulls",
    "Heat",
    "Knicks",
    "Raptors",
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

  Future<void> callApiTeam() async {
    if (selectedSport.value == "Basketball") {
      await baseketballTeam();
    } else if (selectedSport.value == "Baseball") {
      await baseballTeam();
    } else if (selectedSport.value == "Football") {
      await footballTeam();
    } else if (selectedSport.value == "Hockey") {
      await hockeyTeam();
    }
  }

  Future<void> baseketballTeam() async {
    String url =
        "http://site.api.espn.com/apis/site/v2/sports/basketball/nba/teams";
    try {
      isLoading.value = true;
      final response = await NetworkCaller().getRequest(url);
      if (response.isSuccess) {
        debugPrint("======${response.responseData}");

        Get.toNamed(Approute.selectTeam);
      }
    } catch (e) {
      debugPrint("====>>>><<<<=======$e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> baseballTeam() async {
    String url =
        "http://site.api.espn.com/apis/site/v2/sports/baseball/mlb/teams";
    try {
      isLoading.value = true;
      final response = await NetworkCaller().getRequest(url);
      if (response.isSuccess) {
        debugPrint("======${response.responseData}");

        Get.toNamed(Approute.selectTeam);
      }
    } catch (e) {
      debugPrint("====>>>><<<<=======$e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> footballTeam() async {
    String url =
        "http://site.api.espn.com/apis/site/v2/sports/football/nfl/teams";
    try {
      isLoading.value = true;
      final response = await NetworkCaller().getRequest(url);
      if (response.isSuccess) {
        debugPrint("======${response.responseData}");

        Get.toNamed(Approute.selectTeam);
      }
    } catch (e) {
      debugPrint("====>>>><<<<=======$e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> hockeyTeam() async {
    String url =
        "http://site.api.espn.com/apis/site/v2/sports/hockey/nhl/teams";
    try {
      isLoading.value = true;
      final response = await NetworkCaller().getRequest(url);
      if (response.isSuccess) {
        debugPrint("======${response.responseData}");

        Get.toNamed(Approute.selectTeam);
      }
    } catch (e) {
      debugPrint("====>>>><<<<=======$e");
    } finally {
      isLoading.value = false;
    }
  }
}
