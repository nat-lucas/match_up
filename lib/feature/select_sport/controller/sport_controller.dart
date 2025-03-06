import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match_up/core/route/route.dart';
import 'package:match_up/core/utils/image.dart';
import 'package:match_up/feature/select_sport/model/score_model.dart';

import '../../../core/network_caller/service/service.dart';
import '../model/team_model.dart';

class SportController extends GetxController {
  var selectedSport = "".obs;
  var selectedimage = "".obs;
  var isLoading = false.obs;
  var height = 150.0.obs;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var allowMultipleSelection = false.obs;
  var selectedTeamIndices = <int>[].obs;
  final RxList<Team2> teamList = <Team2>[].obs;
  final RxList<Events> competitions = <Events>[].obs;
  final RxMap userData = {}.obs;
  var selectedIndex = (-1).obs;

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

    final team = teamList[index];
    final teamName = team.strTeam;
    final teamLogo = team.strLogo ?? "";
    final teamid = team.idTeam;

    if (teamName.isEmpty || teamLogo.isEmpty) return;

    debugPrint('Allow multiple: ${allowMultipleSelection.value}');

    if (allowMultipleSelection.value) {
      if (selectedTeamIndices.contains(index)) {
        selectedTeamIndices.remove(index);
        selectedTeams.removeWhere((item) => item['name'] == teamName);
      } else {
        selectedTeamIndices.add(index);
        selectedTeams.add({'name': teamName, 'logo': teamLogo, 'id': teamid});
      }
    } else {
      if (selectedTeamIndices.contains(index)) {
        selectedTeamIndices.remove(index);
        selectedTeams.removeWhere((item) => item['name'] == teamName);
      } else {
        if (selectedTeams.length < 2) {
          selectedTeamIndices.add(index);
          selectedTeams.add({'name': teamName, 'logo': teamLogo, 'id': teamid});
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

  Future<void> getFirestoreSelection() async {
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

        var subcription = doc['member'] ?? false;
        debugPrint("==========<><>$subcription");
        allowMultipleSelection.value = subcription;

        userData.assignAll(doc.data() as Map<String, dynamic>);
        log("============<><.,$allowMultipleSelection");
        log("===========$userData");
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
      await scoccer();
    }
  }

  Future<void> baseketballTeam() async {
    await _fetchTeam(
        "https://www.thesportsdb.com/api/v1/json/3/search_all_teams.php?l=NBA");
  }

  Future<void> baseballTeam() async {
    await _fetchTeam(
        "https://www.thesportsdb.com/api/v1/json/3/search_all_teams.php?l=MLB");
  }

  Future<void> scoccer() async {
    await _fetchTeam(
        "https://www.thesportsdb.com/api/v1/json/3/search_all_teams.php?l=English%20Premier%20League");
  }

  Future<void> footballTeam() async {
    await _fetchTeam(
        "https://www.thesportsdb.com/api/v1/json/3/search_all_teams.php?l=NFL");
  }

  Future<void> hockeyTeam() async {
    await _fetchTeam(
        "https://www.thesportsdb.com/api/v1/json/3/search_all_teams.php?l=NHL");
  }

  Future<void> _fetchTeam(String url) async {
    teamList.clear();
    try {
      isLoading.value = true;
      final response = await NetworkCaller().getRequest(url);
      if (response.isSuccess && response.responseData["teams"] != null) {
        teamList.addAll(response.responseData["teams"]
            .map<Team2>((team) => Team2.fromJson(team))
            .toList());

        Get.toNamed(Approute.selectTeam);
      } else if (response.statusCode == 403) {
        Get.snackbar("Eror", "This Not Availabe This moment",
            colorText: Colors.white, backgroundColor: Colors.red);
      } else {
        debugPrint("==========${response.responseData}");
      }
    } catch (e) {
      debugPrint("Error fetching teams: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // Future<void> _fetchdataTeam(String url) async {
  //   try {
  //     isLoading.value = true;
  //     final response = await NetworkCaller().getRequest(url, token: "472735");
  //     if (response.isSuccess) {
  //       debugPrint("===============Response: ${response.responseData}");
  //       final parsedResponse =
  //           Events.fromJson(response.responseData as Map<String, dynamic>);
  //       if (parsedResponse.competitions != null &&
  //           parsedResponse.competitions!.isNotEmpty) {
  //         competitions
  //             .assignAll(parsedResponse.competitions! as Iterable<Events>);
  //         debugPrint("=============$competitions");
  //         debugPrint("=============${competitions.length}");
  //       }
  //       debugPrint("======api data tem=======$competitions");
  //       debugPrint("=============${competitions.length}");
  //     }
  //   } catch (e) {
  //     debugPrint("Error fetching competitions: $e");
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
}
