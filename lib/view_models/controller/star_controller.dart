import 'package:get/get.dart';
import 'base_controller.dart';
import '../services/star_service.dart';
import '../../models/saved_technician_model.dart';

class StarController extends GetxController with BaseController {
  final StarService starService = StarService();
  var isLoading = false.obs;
  final saved = <SavedTechnicianModel>[].obs;

  @override
  void onReady() async {
    super.onReady();
    await getSaved();
  }

  Future<void> getSaved() async {
    try {
      isLoading.value = true;
      final response = await starService.getSavedApi();
      saved.assignAll((response as List).map((item) => SavedTechnicianModel.fromJson(item)));
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      handleError(e, onRetry: () => getSaved());
    }
  }
}
