import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match_up/core/routes/route.dart';
import 'package:match_up/core/utils/image.dart';
import 'package:match_up/feature/select_sport/model/score_model.dart';
import '../../../core/network_caller/service/service.dart';
import '../model/shedule_model.dart';
import '../model/team_model.dart';

class SportController extends GetxController {
  var selectedSport = "".obs;
  var selectedimage = "".obs;
  var isLoading = false.obs;
  var height = 150.0.obs;
  RxBool noMatch = false.obs;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var allowMultipleSelection = false.obs;
  var selectedTeamIndices = <int>[].obs;
  final RxList<Team2> teamList = <Team2>[].obs;
  final RxList<Events> competitions = <Events>[].obs;
  final RxMap userData = {}.obs;
  final RxList<Schedule> scheduleList = <Schedule>[].obs;
  var selectedIndex = (-1).obs;
  RxString firstID = "".obs;
  RxString teamId = "".obs;
  var purchaseDate = "".obs;
  var expireDate = "".obs;

  RxList<Map<String, String>> selectedTeams = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    if (_auth.currentUser != null) {
      getNext5event(firstID.value);
    } else {
      debugPrint("===========<><><><><><>No user found ");
    }
  }

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
    final teamLogo = team.strBadge ?? "";
    final teamid = team.idTeam;

    if (teamName.isEmpty || teamLogo.isEmpty) return;

    debugPrint('Allow multiple: ${allowMultipleSelection.value}');

    if (allowMultipleSelection.value) {
      if (selectedTeamIndices.contains(index)) {
        selectedTeamIndices.remove(index);
        selectedTeams.removeWhere((item) => item['name'] == teamName);

        // ✅ NEW: remove from Firestore
        removeTeamFromFirestore({'id': teamid, 'name': teamName});
      } else {
        selectedTeamIndices.add(index);
        selectedTeams.add({'name': teamName, 'logo': teamLogo, 'id': teamid});
        updateFirestoreSelection();
      }
    } else {
      if (selectedTeamIndices.contains(index)) {
        selectedTeamIndices.remove(index);
        selectedTeams.removeWhere((item) => item['name'] == teamName);

        // ✅ NEW: remove from Firestore
        removeTeamFromFirestore({'id': teamid, 'name': teamName});
      } else {
        if (selectedTeams.isEmpty) {
          selectedTeamIndices.clear();
          selectedTeams.clear();
          selectedTeamIndices.add(index);
          selectedTeams.add({'name': teamName, 'logo': teamLogo, 'id': teamid});
          updateFirestoreSelection();
          update();
          refresh();
        } else {
          Get.snackbar(
            "Selection Limit",
            "You can select only up to 1 teams.",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      }
      debugPrint("==Team ===Leanth==${selectedTeams.length}");
    }

    debugPrint("Selected Teams: $selectedTeams");
  }

  void updateFirestoreSelection() async {
    try {
      User? user = _auth.currentUser;
      if (user == null) return;

      final docRef = firestore.collection('user').doc(user.uid);
      final docSnapshot = await docRef.get();

      List<Map<String, String>> existingTeams = [];

      if (docSnapshot.exists) {
        final data = docSnapshot.data() as Map<String, dynamic>;
        final storedTeams = data["selectedTeam"] ?? [];

        existingTeams = List<Map<String, String>>.from(
          storedTeams.map((e) => Map<String, String>.from(e)),
        );
      }

      final allTeams = {...existingTeams, ...selectedTeams}.toList();

      final mergedTeams = <Map<String, String>>[];

      final seenIds = <String>{};
      for (var team in allTeams) {
        if (team['id'] != null && !seenIds.contains(team['id'])) {
          seenIds.add(team['id']!);
          mergedTeams.add(team);
        }
      }

      await docRef.set({
        "selectedTeam": mergedTeams,
      }, SetOptions(merge: true));

      debugPrint("✅ Firestore updated with teams: $mergedTeams");
    } catch (e) {
      debugPrint("🔥 Firestore update failed: $e");
    }
  }

  Future<void> removeTeamFromFirestore(Map<String, String> teamToRemove) async {
    try {
      User? user = _auth.currentUser;
      if (user == null) return;

      final docRef = firestore.collection('user').doc(user.uid);
      final docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data() as Map<String, dynamic>;
        final storedTeams = data["selectedTeam"] ?? [];

        List<Map<String, String>> existingTeams =
            List<Map<String, String>>.from(
          storedTeams.map((e) => Map<String, String>.from(e)),
        );

        // Remove the team by id
        existingTeams.removeWhere((team) => team['id'] == teamToRemove['id']);

        await docRef.set({
          "selectedTeam": existingTeams,
        }, SetOptions(merge: true));

        debugPrint("✅ Team removed from Firestore: ${teamToRemove['name']}");
      }
    } catch (e) {
      debugPrint("🔥 Failed to remove team: $e");
    }
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
        selectedTeams.clear();

        selectedTeams.addAll(getUserTeam);

        if (selectedTeams.isNotEmpty) {
          firstID.value = selectedTeams.first['id']!;
          teamId.value = selectedTeams.first['id']!;
          await getNext5event(firstID.value);
          debugPrint("===done===========$firstID");
        } else {
          firstID.value = "";
        }

        var subcription = doc['member'] ?? false;
        var pDate = doc["purchase-date"] ?? "";
        var eDate = doc["expire-date"] ?? "";

        allowMultipleSelection.value = subcription;
        purchaseDate.value = pDate;
        expireDate.value = eDate;

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

  Future<void> getNext5event(String id) async {
    scheduleList.clear();
    var url = "https://www.thesportsdb.com/api/v2/json/schedule/next/team/$id";
    try {
      isLoading.value = true;
      final response = await NetworkCaller().getRequest(url, token: "472735");

      if (response.isSuccess) {
        debugPrint("===============Response: ${response.responseData}");

        var jsonData = response.responseData;

        if (jsonData != null && jsonData['Message'] == "No data found") {
          noMatch.value = true;
          debugPrint("=============No Match Found ");
          return;
        }

        if (jsonData != null && jsonData['schedule'] != null) {
          noMatch.value = false;
          scheduleList.value = (jsonData['schedule'] as List)
              .map((item) => Schedule.fromJson(item))
              .toList();

          debugPrint("==========list======${scheduleList.length}");
          for (var schedule in scheduleList) {
            debugPrint(
                "Event: ${schedule.strEvent}, Date: ${schedule.dateEvent}, Team: ${schedule.strHomeTeam} vs ${schedule.strAwayTeam}");
          }
        }
      } else if (response.statusCode == 403) {
        noMatch.value = false;
        Get.snackbar("Error", "This is not available at this moment",
            duration: Duration(seconds: 2),
            colorText: Colors.white,
            backgroundColor: Colors.red);
        debugPrint('==========${response.responseData}');
      } else {
        debugPrint("============Match Not Found");
      }
    } catch (e) {
      debugPrint("Error fetching competitions: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
