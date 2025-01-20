import 'package:get/get.dart';

class EditTeamController extends GetxController{
   var allowMultipleSelection = false.obs;
  var selectedTeamIndices = <int>[].obs;

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