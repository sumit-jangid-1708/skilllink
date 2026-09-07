import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'base_controller.dart';
import '../services/request_details_service.dart';
import '../../models/service_request_model.dart';
import '../../models/review_model.dart';
import '../../models/technician_model.dart';
import 'requests_controller.dart';
import '../../utils/utils.dart';
import '../../data/app_exceptions.dart';

class RequestDetailsController extends GetxController with BaseController {
  final RequestDetailsService requestDetailsService = RequestDetailsService();
  var isLoading = false.obs;
  final requestModel = Rxn<ServiceRequestModel>();
  final reviewModel = Rxn<ReviewModel>();
  final technicianModel = Rxn<TechnicianModel>();
  final rating = 0.obs;
  final commentController = TextEditingController();

  @override
  void onClose() {
    commentController.dispose();
    super.onClose();
  }
  int? requestId;

  @override
  void onReady() async {
    super.onReady();
    requestId = Get.arguments is int ? Get.arguments as int : null;
    await getRequest();
  }

  Future<void> getRequest() async {
    if (requestId == null) return;
    try {
      isLoading.value = true;
      final response = await requestDetailsService.getRequestApi(requestId!);
      requestModel.value = ServiceRequestModel.fromJson(response);
      isLoading.value = false;
      await getTechnician();
    } catch (e) {
      isLoading.value = false;
      handleError(e, onRetry: () => getRequest());
    }
  }

  Future<void> cancelRequest() async {
    if (requestId == null || isLoading.value) return;
    try {
      isLoading.value = true;
      final response = await requestDetailsService.cancelRequestApi(requestId!);
      requestModel.value = ServiceRequestModel.fromJson(response);
      if (Get.isRegistered<RequestsController>()) { await Get.find<RequestsController>().getRequests(); }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      handleError(e, onRetry: () => cancelRequest());
    }
  }

  Future<void> getTechnician() async {
    final id = requestModel.value?.technician;
    technicianModel.value = null;
    if (id == null) return;
    try {
      final response = await requestDetailsService.getTechnicianApi(id);
      technicianModel.value = TechnicianModel.fromJson(response);
    } catch (e) {
      handleError(e, onRetry: () => getTechnician());
    }
  }

  Future<void> submitReview(String comment) async {
    if (isLoading.value || reviewModel.value != null) return;
    try {
      isLoading.value = true;
      if (requestId == null || rating.value < 1) { throw FetchDataException('Please select a rating from 1 to 5.'); }
      final response = await requestDetailsService.submitReviewApi(requestId!, {'rating': rating.value, 'comment': comment});
      reviewModel.value = ReviewModel.fromJson(response);
      Utils.successToast('Review submitted successfully');
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      handleError(e, onRetry: () => submitReview(comment));
    }
  }
}
