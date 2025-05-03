import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SettingController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  RxBool member = false.obs;
  RxBool isLoading = false.obs;

  var isSwitchOn = false.obs;
  var expandedIndex = (-1).obs;
  var userData = {}.obs;

  void toggleSwitch(bool value) {
    isSwitchOn.value = value;
  }

  Future<void> logout() async {
    final currentUser = _auth.currentUser;
    await _firestore.collection('user').doc(currentUser!.uid).update({
      "fcm_token":"",
    });
    await _auth.signOut();
  }

  Future<void> fetchUserData() async {
    try {
      final User? currentUser = _auth.currentUser;

      if (currentUser != null) {
        String uid = currentUser.uid;

        DocumentSnapshot<Map<String, dynamic>> userDoc =
            await _firestore.collection('user').doc(uid).get();

        if (userDoc.exists) {
          userData.value = userDoc.data() ?? {};
          debugPrint("User data fetched: $userData");
          name.text = userData['name'];
          email.text = userData['email'];
          member.value = userData['member'];
          debugPrint("=========$member");
        } else {
          debugPrint("No user data found for UID: $uid");
        }
      } else {
        debugPrint("No authenticated user found.");
      }
    } catch (e) {
      debugPrint("Error fetching user data: $e");
    }
  }

  Future<void> updateUserData() async {
    try {
      isLoading.value = true;
      final currentUser = _auth.currentUser;

      if (currentUser != null) {
        await _firestore.collection('user').doc(currentUser.uid).update({
          "name": name.text,
        });

        debugPrint("User data updated successfully.");
        await fetchUserData();
      } else {
        isLoading.value = false;
        debugPrint("User is null, cannot update data.");
        Get.snackbar("Error", "User not found. Please log in again.",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("Error updating user data: $e");
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
      Get.back();
      debugPrint("Update user data process completed.");
    }
  }

  final ImagePicker _picker = ImagePicker();
  Rx<File?> selectedImage = Rx<File?>(null);

  Future<void> pickImageForAndroid() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        selectedImage.value = File(image.path);

        debugPrint("Image picked for Android: ${image.path}");
        String downloadUrl = await uploadImageToFirebase(selectedImage.value!);

        await saveImageUrlToFirestore(downloadUrl);
      } else {
        debugPrint("No image selected.");
      }
    } catch (e) {
      debugPrint("Error picking image for Android: $e");
    }
  }

  // Future<void> pickImageForIOS() async {
  //   try {
  //     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  //     if (image != null) {
  //       selectedImage.value = File(image.path);
  //       debugPrint("Image picked for iOS: ${image.path}");
  //     } else {
  //       debugPrint("No image selected.");
  //     }
  //   } catch (e) {
  //     debugPrint("Error picking image for iOS: $e");
  //   }
  // }

  Future<void> pickImageForIOS() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        selectedImage.value = File(image.path);
        debugPrint("Image picked for iOS: ${image.path}");

        String downloadUrl = await uploadImageToFirebase(selectedImage.value!);

        await saveImageUrlToFirestore(downloadUrl);
        debugPrint("Image uploaded and URL saved: $downloadUrl");
      } else {
        debugPrint("No image selected.");
      }
    } catch (e) {
      debugPrint("Error picking image for iOS: $e");
    }
  }

  Future<String> uploadImageToFirebase(File imageFile) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageRef =
          FirebaseStorage.instance.ref().child("uploads/$fileName.jpg");
      UploadTask uploadTask = storageRef.putFile(imageFile);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      debugPrint("Error uploading image: $e");
      rethrow;
    }
  }

  Future<void> saveImageUrlToFirestore(String imageUrl) async {
    final User? currentUser = _auth.currentUser;
    try {
      await FirebaseFirestore.instance
          .collection("user")
          .doc(currentUser?.uid)
          .update(
        {"imageUrl": imageUrl},
      );
      await fetchUserData();
    } catch (e) {
      debugPrint("Error saving image URL to Firestore: $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }
}
