import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  // Text Controllers
  final nameController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  final cityController = TextEditingController().obs;
  final pinCodeController = TextEditingController().obs;

  // Dropdown values
  final dob = '15 Aug 1995'.obs;
  final gender = 'Male'.obs;
  final state = 'Karnataka'.obs;

  // Image
  final profileImage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize with existing data if any
    nameController.value.text = "Rahul Kumar";
    phoneController.value.text = "+91 98765 43210";
    emailController.value.text = "rahul.kumar@email.com";
    addressController.value.text = "Koramangala, Bengaluru";
    cityController.value.text = "Bengaluru";
    pinCodeController.value.text = "560034";
  }

  void updateGender(String? value) {
    if (value != null) gender.value = value;
  }

  void updateState(String? value) {
    if (value != null) state.value = value;
  }

  void saveProfile() {
    // Logic to save profile
    Get.back();
    Get.snackbar("Success", "Profile updated successfully", 
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white
    );
  }
}
