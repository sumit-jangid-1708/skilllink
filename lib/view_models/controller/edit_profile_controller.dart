import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'base_controller.dart';
import 'profile_controller.dart';
import 'home_controller.dart';
import '../services/edit_profile_service.dart';
import '../../models/customer_profile_model.dart';
import '../../models/profile_model.dart';

class EditProfileController extends GetxController with BaseController {
  final EditProfileService editProfileService = EditProfileService();
  final profileModel = Rxn<CustomerProfileModel>();
  var isLoading = false.obs;
  String? selectedPhoto;
  bool removePhoto = false;

  @override
  void onReady() {
    super.onReady();
    getProfile();
  }

  Future<void> getProfile() async {
    try {
      isLoading.value = true;
      final response = await editProfileService.getProfileApi();
      final model = CustomerProfileModel.fromJson(response);
      profileModel.value = model;
      nameController.value.text = model.fullName;
      emailController.value.text = model.email ?? '';
      addressController.value.text = model.address;
      cityController.value.text = model.city;
      pinCodeController.value.text = model.pincode;
      profileImage.value = model.profilePhoto ?? '';
      final me = ProfileModel.fromJson(await editProfileService.getMeApi());
      phoneController.value.text = me.phoneNumber;
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      handleError(e, onRetry: () => getProfile());
    }
  }

  void changePhoto() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedPhoto = image.path;
      profileImage.value = image.path;
      removePhoto = false;
    }
  }

  void removeProfilePhoto() {
    selectedPhoto = null;
    profileImage.value = '';
    removePhoto = true;
  }
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

  void updateGender(String? value) {
    if (value != null) gender.value = value;
  }

  void updateState(String? value) {
    if (value != null) state.value = value;
  }

  void saveProfile() async {
    if (isLoading.value) return;
    try {
      isLoading.value = true;
      final data = <String, dynamic>{
        'full_name': nameController.value.text.trim(),
        'email': emailController.value.text.trim(),
        'address': addressController.value.text.trim(),
        'city': cityController.value.text.trim(),
        'pincode': pinCodeController.value.text.trim(),
        if (removePhoto) 'profile_photo': null,
      };
      final response = selectedPhoto == null
          ? await editProfileService.updateProfileApi(data)
          : await editProfileService.uploadProfileApi(
              data.map((key, value) => MapEntry(key, value.toString())), selectedPhoto!);
      profileModel.value = CustomerProfileModel.fromJson(response);
      if (Get.isRegistered<ProfileController>()) {
        await Get.find<ProfileController>().getProfile();
      }
      if (Get.isRegistered<HomeController>()) {
        await Get.find<HomeController>().getProfile();
      }
      isLoading.value = false;
      Get.back();
      Get.snackbar("Success", "Profile updated successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white);
    } catch (e) {
      isLoading.value = false;
      handleError(e, onRetry: () => saveProfile());
    }
  }
}
