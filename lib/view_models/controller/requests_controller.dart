import 'package:get/get.dart';
import 'base_controller.dart';
import '../services/requests_service.dart';
import '../../models/service_request_model.dart';

class RequestsController extends GetxController with BaseController {
  final RequestsService requestsService = RequestsService();
  var isLoading = false.obs;
  final requests = <ServiceRequestModel>[].obs;

  @override
  void onReady() async {
    super.onReady();
    await getRequests();
  }

  Future<void> getRequests() async {
    try {
      isLoading.value = true;
      final response = await requestsService.getRequestsApi();
      requests.assignAll((response as List).map((item) => ServiceRequestModel.fromJson(item)));
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      handleError(e, onRetry: () => getRequests());
    }
  }
}
