import 'package:get/get.dart';
import 'package:skill_link/res/routes/routes_names.dart';

class WorkerProfileController extends GetxController {
  final isFavorite = false.obs;

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  void bookNow() {
    Get.toNamed(RouteName.requestServiceScreen);
  }

  void startChat() {
    Get.snackbar("Chat", "Opening chat with Suresh M...");
  }
}
