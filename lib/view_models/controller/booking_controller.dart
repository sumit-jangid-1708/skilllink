import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BookingController extends GetxController {
  var selectedService = RxnString();
  var selectedSubCategory = RxnString();
  var selectedUrgency = "".obs;
  var scheduledDate = Rxn<DateTime>();
  var selectedImage = Rxn<File>();
  TextEditingController problemTextController = TextEditingController();

  void selectUrgency(String type) {
    selectedUrgency.value = type;
  }
}
