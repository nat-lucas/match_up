import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match_up/core/route/route.dart';
import 'package:match_up/core/utils/image.dart';
import 'package:match_up/feature/select_sport/model/score_model.dart';

import '../../../core/network_caller/service/service.dart';
import '../model/baseketball_all_team_model.dart';

class SportController extends GetxController {
  var selectedSport = "".obs;
  var selectedimage = "".obs;
  var isLoading = false.obs;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var allowMultipleSelection = false.obs;
  var selectedTeamIndices = <int>[].obs;
  final RxList<Teams> teamList = <Teams>[].obs;
  final RxList<Events> competitions = <Events>[].obs;
  var selectedIndex = (-1).obs;
  @override
  void onInit() {
    super.onInit();
    getFirestoreSelection();
  }

  RxList<Map<String, String>> selectedTeams = <Map<String, String>>[].obs;

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
      "name": "Soccer",
      "image": ImagePath.soccer,
    },
    {
      "name": "Hockey",
      "image": ImagePath.hokie,
    },
    {
      "name": "Football",
      "image": ImagePath.football,
    },
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
    final teamid = team?.uid ?? "";

    

    if (teamName.isEmpty || teamLogo.isEmpty) return;

    debugPrint('Allow multiple: ${allowMultipleSelection.value}');

    if (allowMultipleSelection.value) {
      if (selectedTeamIndices.contains(index)) {
        selectedTeamIndices.remove(index);
        selectedTeams.removeWhere((item) => item['name'] == teamName);
      } else {
        selectedTeamIndices.add(index);
        selectedTeams.add({'name': teamName, 'logo': teamLogo,'id': teamid});
      }
    } else {
      if (selectedTeamIndices.contains(index)) {
        selectedTeamIndices.remove(index);
        selectedTeams.removeWhere((item) => item['name'] == teamName);
      } else {
        if (selectedTeams.length < 2) {
          selectedTeamIndices.add(index);
          selectedTeams.add({'name': teamName, 'logo': teamLogo,'id': teamid});
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

    updateFirestoreSelection();
    debugPrint("Selected Teams: $selectedTeams");
  }

  void updateFirestoreSelection() async {
    User? user = _auth.currentUser;
    firestore.collection('user').doc(user?.uid).update({
      "selectedTeam": selectedTeams,
    });
  }

  void getFirestoreSelection() async {
    User? user = _auth.currentUser;
    if (user == null) return;

    try {
      DocumentSnapshot doc =
          await firestore.collection('user').doc(user.uid).get();

      if (doc.exists) {
        var data = doc.data() as Map<String, dynamic>;
        List<dynamic> rawTeams = data["selectedTeam"] ?? [];

        List<Map<String, String>> getUserTeam = rawTeams.map((e) {
          return Map<String, String>.from(e as Map);
        }).toList();

        selectedTeams.addAll(getUserTeam);

        debugPrint("-=-=-=-=-=-= Selected UserTeam: $getUserTeam");
      } else {
        debugPrint("No document found for user: ${user.uid}");
      }
    } catch (e) {
      debugPrint("Error retrieving Firestore data: $e");
    }
    debugPrint("-=-=-=-=-=-= Selected CurrentTeams: $selectedTeams");
  }

  Future<void> callApiTeam() async {
    teamList.clear();
    selectedTeamIndices.clear();
    selectedTeams.clear();
    competitions.clear();

    if (selectedSport.value == "Basketball") {
      await baseketballTeam();
    } else if (selectedSport.value == "Baseball") {
      await baseballTeam();
    } else if (selectedSport.value == "Football") {
      await footballTeam();
    } else if (selectedSport.value == "Hockey") {
      await hockeyTeam();
    } else if (selectedSport.value == "Soccer") {
      await footballTeam();
    }
  }

  Future<void> baseketballTeam() async {
    await _fetchTeam(
        "http://site.api.espn.com/apis/site/v2/sports/basketball/nba/teams");
    await _fetchdataTeam(
        "http://site.api.espn.com/apis/site/v2/sports/basketball/nba/scoreboard");
  }

  Future<void> baseballTeam() async {
    await _fetchTeam(
        "http://site.api.espn.com/apis/site/v2/sports/baseball/mlb/teams");
    await _fetchdataTeam(
        "http://site.api.espn.com/apis/site/v2/sports/baseball/mlb/scoreboard");
  }

  Future<void> footballTeam() async {
    await _fetchTeam(
        "http://site.api.espn.com/apis/site/v2/sports/football/nfl/teams");
    await _fetchdataTeam(
        "https://site.api.espn.com/apis/site/v2/sports/football/nfl/scoreboard");
  }

  Future<void> hockeyTeam() async {
    await _fetchTeam(
        "http://site.api.espn.com/apis/site/v2/sports/hockey/nhl/teams");
    await _fetchdataTeam(
        "http://site.api.espn.com/apis/site/v2/sports/hockey/nhl/scoreboard");
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

  Future<void> _fetchdataTeam(String url) async {
    try {
      isLoading.value = true;
      final response = await NetworkCaller().getRequest(url);
      if (response.isSuccess) {
        debugPrint("===============Response: ${response.responseData}");
        final parsedResponse =
            Events.fromJson(response.responseData as Map<String, dynamic>);
        if (parsedResponse.competitions != null &&
            parsedResponse.competitions!.isNotEmpty) {
          competitions
              .assignAll(parsedResponse.competitions! as Iterable<Events>);
          debugPrint("=============$competitions");
          debugPrint("=============${competitions.length}");
        }
        debugPrint("======api data tem=======$competitions");
        debugPrint("=============${competitions.length}");
      }
    } catch (e) {
      debugPrint("Error fetching competitions: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
