import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match_up/core/utils/image.dart';

class SportController extends GetxController {
  var selectedSport = "".obs;
  var selectedimage = "".obs;

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
    debugPrint("===========>>>${selectedSport.value}");
    debugPrint("===========>>>${selectedimage.value}");
  }
}
