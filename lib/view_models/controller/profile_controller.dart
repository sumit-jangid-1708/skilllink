import 'package:get/get.dart';
import 'base_controller.dart';
import '../services/profile_service.dart';
import '../../models/profile_model.dart';
import '../../data/storage/app_storage.dart';
import '../../res/routes/routes_names.dart';

class ProfileController extends GetxController with BaseController {
  Future<void> logout() async {
    await AppStorage.removeToken();
    Get.offAllNamed(RouteName.loginScreen);
  }
  final ProfileService profileService = ProfileService();
  var isLoading = false.obs;
  final profileModel = Rxn<ProfileModel>();

  @override
  void onReady() async {
    super.onReady();
    await getProfile();
  }

  Future<void> getProfile() async {
    try {
      isLoading.value = true;
      final response = await profileService.getProfileApi();
      profileModel.value = ProfileModel.fromJson(response);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      handleError(e, onRetry: () => getProfile());
    }
  }
}
