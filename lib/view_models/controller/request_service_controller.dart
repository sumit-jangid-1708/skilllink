import 'base_controller.dart';
import 'requests_controller.dart';
import '../services/request_service_service.dart';
import '../../models/service_request_model.dart';
import '../../models/category_model.dart';
import '../../models/customer_profile_model.dart';
import '../../utils/utils.dart';
import '../../data/app_exceptions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RequestServiceController extends GetxController with BaseController {
  final RequestServiceService requestServiceService = RequestServiceService();
  var isLoading = false.obs;
  final requestModel = Rxn<ServiceRequestModel>();
  final categoryModels = <CategoryModel>[].obs;
  CustomerProfileModel? profile;

  final selectedCategoryIndex = 0.obs;
  final issueController = TextEditingController();
  final charCount = 0.obs;
  final selectedDate = Rxn<DateTime>();
  final selectedTime = Rxn<TimeOfDay>();
  final location = ''.obs;
  
  final RxList<String> images = <String>[].obs;
  final ImagePicker _picker = ImagePicker();

  List<Map<String, dynamic>> get categories => categoryModels.map((item) => {
    'id': item.id, 'name': item.name,
    'icon': {
      'plumbing': Icons.plumbing_outlined, 'electrical': Icons.bolt_outlined,
      'painting': Icons.format_paint_outlined, 'ac repair': Icons.ac_unit_outlined,
      'carpentry': Icons.handyman_outlined,
    }[item.name.toLowerCase()] ?? Icons.handyman_outlined,
  }).toList();

  @override
  void onReady() {
    super.onReady();
    getRequestData();
  }

  Future<void> getRequestData() async {
    try {
      isLoading.value = true;
      final response = await requestServiceService.getCategoriesApi();
      categoryModels.assignAll((response as List).map((item) => CategoryModel.fromJson(item)));
      final args = Get.arguments;
      if (args is Map && args['category_id'] != null) {
        final index = categoryModels.indexWhere((item) => item.id == args['category_id']);
        if (index >= 0) selectedCategoryIndex.value = index;
      }
      profile = CustomerProfileModel.fromJson(await requestServiceService.getProfileApi());
      location.value = [profile!.address, profile!.city, profile!.pincode]
          .where((value) => value.isNotEmpty).join(', ');
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      handleError(e, onRetry: () => getRequestData());
    }
  }

  void createRequest() async {
    if (isLoading.value) return;
    try {
      isLoading.value = true;
      if (categoryModels.isEmpty || issueController.text.trim().isEmpty) {
        throw FetchDataException('Please select a category and describe your issue.');
      }
      if (profile == null || profile!.address.isEmpty || profile!.city.isEmpty) {
        throw FetchDataException('Please save your address and city in Edit Profile first.');
      }
      
      if (selectedDate.value != null && selectedTime.value == null) {
        throw FetchDataException('Please select a time for the scheduled service.');
      }
      if (selectedDate.value == null && selectedTime.value != null) {
        throw FetchDataException('Please select a date for the scheduled service.');
      }

      DateTime? scheduled;
      if (selectedDate.value != null && selectedTime.value != null) {
        final date = selectedDate.value!;
        final time = selectedTime.value!;
        scheduled = DateTime(date.year, date.month, date.day, time.hour, time.minute);
        
        if (!scheduled.isAfter(DateTime.now())) {
          selectedTime.value = null;
          isLoading.value = false;
          final context = Get.context;
          if (context != null && context.mounted) {
            Utils.toastMessage('Selected time has passed. Please choose a new time.');
            await selectTime(context);
            return;
          }
          throw FetchDataException('Please select a future date and time.');
        }
      }

      final data = <String, dynamic>{
        'skill_category': categoryModels[selectedCategoryIndex.value].id,
        'description': issueController.text.trim(),
        'address': profile!.address,
        'city': profile!.city,
        'urgency': scheduled == null ? 'normal' : 'scheduled',
      };

      if (scheduled != null) {
        data['scheduled_at'] = scheduled.toUtc().toIso8601String();
      }

      final response = images.isEmpty
          ? await requestServiceService.createRequestApi(data)
          : await requestServiceService.uploadRequestApi(
              data.map((key, value) => MapEntry(key, value.toString())), images.first);
      
      requestModel.value = ServiceRequestModel.fromJson(response);
      
      if (Get.isRegistered<RequestsController>()) {
        await Get.find<RequestsController>().getRequests();
      }
      
      isLoading.value = false;
      Utils.successToast('Service request created successfully');
      
      // Clear selections
      issueController.clear();
      images.clear();
      selectedDate.value = null;
      selectedTime.value = null;
      
      Get.back(); // Return to previous screen after success
    } catch (e) {
      isLoading.value = false;
      handleError(e, onRetry: () => createRequest());
    }
  }

  @override
  void onInit() {
    super.onInit();
    issueController.addListener(() {
      charCount.value = issueController.text.length;
    });
  }

  void setCategory(int index) => selectedCategoryIndex.value = index;

  Future<void> pickImages() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      images.assignAll([pickedFile.path]);
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final previousDate = selectedDate.value;
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: previousDate != null && !previousDate.isBefore(today) ? previousDate : today,
      firstDate: today,
      lastDate: now.add(const Duration(days: 365)),
    );
    if (picked != null) {
      selectedDate.value = picked;
      final time = selectedTime.value;
      if (time != null &&
          !DateTime(picked.year, picked.month, picked.day, time.hour, time.minute)
              .isAfter(DateTime.now())) {
        selectedTime.value = null;
      }
      if (selectedTime.value == null) {
        // Automatically open time picker after date selection if time isn't selected
        if (context.mounted) selectTime(context);
      }
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final now = DateTime.now();
    final date = selectedDate.value ?? DateTime(now.year, now.month, now.day);
    final nextTime = now.add(const Duration(minutes: 5));
    final oldTime = selectedTime.value;
    final oldDateTime = oldTime == null ? null :
        DateTime(date.year, date.month, date.day, oldTime.hour, oldTime.minute);
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: oldDateTime != null && oldDateTime.isAfter(now)
          ? oldTime! : TimeOfDay.fromDateTime(nextTime),
    );
    
    if (picked != null) {
      {
        final now = DateTime.now();
        final selected = DateTime(
          date.year,
          date.month,
          date.day,
          picked.hour,
          picked.minute,
        );
        
        if (!selected.isAfter(now)) {
          Utils.toastMessage('Please select a future time for the selected date');
          return;
        }
      }
      selectedTime.value = picked;
    }
  }

  @override
  void onClose() {
    issueController.dispose();
    super.onClose();
  }
}
