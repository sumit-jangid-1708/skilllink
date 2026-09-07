import 'package:get/get.dart';
import 'base_controller.dart';
import '../services/categories_service.dart';
import '../../models/category_model.dart';

class CategoriesController extends GetxController with BaseController {
  final CategoriesService categoriesService = CategoriesService();
  var isLoading = false.obs;
  final categories = <CategoryModel>[].obs;
  final search = ''.obs;

  @override
  void onReady() async {
    super.onReady();
    await getCategories();
  }

  Future<void> getCategories() async {
    try {
      isLoading.value = true;
      final response = await categoriesService.getCategoriesApi();
      categories.assignAll((response as List).map((item) => CategoryModel.fromJson(item)));
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      handleError(e, onRetry: () => getCategories());
    }
  }
}
