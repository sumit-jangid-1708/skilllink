import 'package:get/get.dart';
import 'base_controller.dart';
import 'star_controller.dart';
import '../services/worker_profile_service.dart';
import '../../models/technician_model.dart';
import 'package:skill_link/res/routes/routes_names.dart';

class WorkerProfileController extends GetxController with BaseController {
  final WorkerProfileService workerProfileService = WorkerProfileService();
  var isLoading = false.obs;
  final technicianModel = Rxn<TechnicianModel>();
  int? technicianId;

  @override
  void onReady() {
    super.onReady();
    technicianId = Get.arguments is int ? Get.arguments as int : null;
    getTechnician();
  }

  Future<void> getTechnician() async {
    if (technicianId == null) return;
    try {
      isLoading.value = true;
      final response = await workerProfileService.getTechnicianApi(technicianId!);
      technicianModel.value = TechnicianModel.fromJson(response);
      final saved = await workerProfileService.getSavedApi();
      isFavorite.value = (saved as List).any((item) => item['technician']['id'] == technicianId);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      handleError(e, onRetry: () => getTechnician());
    }
  }
  final isFavorite = false.obs;

  void toggleFavorite() async {
    if (isLoading.value || technicianId == null) return;
    try {
      isLoading.value = true;
      if (isFavorite.value) {
        await workerProfileService.removeTechnicianApi(technicianId!);
      } else {
        await workerProfileService.saveTechnicianApi(technicianId!);
      }
      isFavorite.value = !isFavorite.value;
      if (Get.isRegistered<StarController>()) {
        await Get.find<StarController>().getSaved();
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      handleError(e, onRetry: () => toggleFavorite());
    }
  }

  void bookNow() {
    Get.toNamed(RouteName.requestServiceScreen, arguments: {
      'category_id': technicianModel.value?.skillCategories.firstOrNull?.id,
    });
  }

  void startChat() {
    Get.snackbar("Chat", "Opening chat with Suresh M...");
  }
}
