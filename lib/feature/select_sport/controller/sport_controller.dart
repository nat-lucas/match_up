import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match_up/core/route/route.dart';
import 'package:match_up/core/utils/image.dart';

import '../../../core/network_caller/service/service.dart';
import '../model/baseketball_all_team_model.dart';

class SportController extends GetxController {
  var selectedSport = "".obs;
  var selectedimage = "".obs;
  var isLoading = false.obs;
  var allowMultipleSelection = true.obs;
  var selectedTeamIndices = <int>[].obs;
  final RxList<Teams> teamList = <Teams>[].obs;
  var selectedIndex = (-1).obs;

  final RxList<Map<String, String>> selectedTeams = <Map<String, String>>[].obs;

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
  if (index >= teamList.length) return;

  final team = teamList[index].team;
  final teamName = team?.name ?? "";
  final teamLogo = team?.logos?.first.href ?? "";

  if (teamName.isEmpty || teamLogo.isEmpty) return;

  debugPrint('Allow multiple: ${allowMultipleSelection.value}');

  if (allowMultipleSelection.value) {
    if (selectedTeamIndices.contains(index)) {
      selectedTeamIndices.remove(index);
      selectedTeams.removeWhere((item) => item['name'] == teamName);
    } else {
      selectedTeamIndices.add(index);
      selectedTeams.add({'name': teamName, 'logo': teamLogo});
    }
  } else {
    if (selectedTeamIndices.contains(index)) {
      selectedTeamIndices.remove(index);
      selectedTeams.removeWhere((item) => item['name'] == teamName);
    } else {
      if (selectedTeams.length < 2) {
        selectedTeamIndices.add(index);
        selectedTeams.add({'name': teamName, 'logo': teamLogo});
      } else {
        Get.snackbar(
          "Selection Limit",
          "You can select only up to 2 teams.",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  debugPrint("Selected Teams: $selectedTeams");
}


  Future<void> callApiTeam() async {
    teamList.clear();
    selectedTeamIndices.clear();
    selectedTeams.clear();

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
    await _fetchTeam(
        "http://site.api.espn.com/apis/site/v2/sports/basketball/nba/teams");
  }

  Future<void> baseballTeam() async {
    await _fetchTeam(
        "http://site.api.espn.com/apis/site/v2/sports/baseball/mlb/teams");
  }

  Future<void> footballTeam() async {
    await _fetchTeam(
        "http://site.api.espn.com/apis/site/v2/sports/football/nfl/teams");
  }

  Future<void> hockeyTeam() async {
    await _fetchTeam(
        "http://site.api.espn.com/apis/site/v2/sports/hockey/nhl/teams");
  }

  Future<void> _fetchTeam(String url) async {
    try {
      isLoading.value = true;
      final response = await NetworkCaller().getRequest(url);
      if (response.isSuccess) {
        final parsedResponse = BaseballTeam.fromJson(
            response.responseData as Map<String, dynamic>);

        if (parsedResponse.sports != null &&
            parsedResponse.sports!.isNotEmpty) {
          teamList.assignAll(parsedResponse.sports![0].leagues![0].teams ?? []);
        }

        Get.toNamed(Approute.selectTeam);
      }
    } catch (e) {
      debugPrint("Error fetching teams: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
