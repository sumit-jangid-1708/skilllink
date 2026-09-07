import 'package:get/get.dart';
import 'base_controller.dart';
import '../services/home_service.dart';
import '../../models/category_model.dart';
import '../../models/technician_model.dart';
import '../../models/profile_model.dart';

class HomeController extends GetxController with BaseController {
  final HomeService homeService = HomeService();
  var isLoading = false.obs;
  final categories = <CategoryModel>[].obs;
  final technicians = <TechnicianModel>[].obs;
  final profileModel = Rxn<ProfileModel>();
  final selectedCategory = Rxn<int>();
  final search = ''.obs;

  @override
  void onReady() async {
    super.onReady();
    await getProfile();
    await getCategories();
    await getTechnicians();
  }

  Future<void> getProfile() async {
    try {
      isLoading.value = true;
      final response = await homeService.getProfileApi();
      profileModel.value = ProfileModel.fromJson(response);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      handleError(e, onRetry: () => getProfile());
    }
  }

  Future<void> getCategories() async {
    try {
      isLoading.value = true;
      final response = await homeService.getCategoriesApi();
      categories.assignAll((response as List).map((item) => CategoryModel.fromJson(item)));
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      handleError(e, onRetry: () => getCategories());
    }
  }

  Future<void> getTechnicians({int? category}) async {
    try {
      isLoading.value = true;
      selectedCategory.value = category;
      final response = await homeService.getTechniciansApi(category: category, city: profileModel.value?.profile?.city);
      technicians.assignAll((response as List).map((item) => TechnicianModel.fromJson(item)));
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      handleError(e, onRetry: () => getTechnicians(category: category));
    }
  }
}
