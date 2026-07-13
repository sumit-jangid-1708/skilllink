import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RequestServiceController extends GetxController {
  final selectedCategoryIndex = 0.obs;
  final issueController = TextEditingController();
  final charCount = 0.obs;
  final selectedDate = Rxn<DateTime>();
  final selectedTime = Rxn<TimeOfDay>();
  final location = "Koramangala, Bengaluru 560034".obs;
  
  final RxList<String> images = <String>[].obs;
  final ImagePicker _picker = ImagePicker();

  final categories = [
    {'name': 'Plumbing', 'icon': Icons.plumbing_outlined},
    {'name': 'Electrical', 'icon': Icons.bolt_outlined},
    {'name': 'Painting', 'icon': Icons.format_paint_outlined},
    {'name': 'AC Repair', 'icon': Icons.ac_unit_outlined},
    {'name': 'Carpentry', 'icon': Icons.handyman_outlined},
  ];

  @override
  void onInit() {
    super.onInit();
    issueController.addListener(() {
      charCount.value = issueController.text.length;
    });
  }

  void setCategory(int index) => selectedCategoryIndex.value = index;

  Future<void> pickImages() async {
    final List<XFile> pickedFiles = await _picker.pickMultiImage();
    if (pickedFiles.isNotEmpty) {
      images.addAll(pickedFiles.map((file) => file.path));
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
    );
    if (picked != null) selectedDate.value = picked;
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) selectedTime.value = picked;
  }

  @override
  void onClose() {
    issueController.dispose();
    super.onClose();
  }
}
