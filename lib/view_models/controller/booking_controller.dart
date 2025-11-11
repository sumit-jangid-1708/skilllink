import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BookingController extends GetxController {
  // Selected values
  var selectedService = RxnString();
  var selectedSubCategory = RxnString();
  var selectedUrgency = "".obs;
  var scheduledDate = Rxn<DateTime>();
  var selectedImage = Rxn<File>();

  // Text controller
  final problemTextController = TextEditingController();

  // Selectors
  void selectUrgency(String type) {
    selectedUrgency.value = type;
  }

  void setDate(DateTime date) {
    scheduledDate.value = date;
  }

  void setImage(File image) {
    selectedImage.value = image;
  }

  // Clear form
  void clearForm() {
    selectedService.value = null;
    selectedSubCategory.value = null;
    selectedUrgency.value = "";
    scheduledDate.value = null;
    selectedImage.value = null;
    problemTextController.clear();
  }

  // Booking logic
  void bookService() {
    if (selectedService.value == null || selectedUrgency.value.isEmpty) {
      Get.snackbar(
        "Incomplete Form",
        "Please select a service type and urgency before booking.",
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    // TODO: Implement API call or save logic
    Get.snackbar(
      "Success",
      "Your service has been booked successfully!",
      snackPosition: SnackPosition.TOP,
    );

    clearForm(); // optional: reset after booking
  }

  @override
  void onClose() {
    problemTextController.dispose();
    super.onClose();
  }
}
