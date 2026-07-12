import 'dart:async';
import 'package:get/get.dart';
import 'package:skill_link/res/routes/routes_names.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  void _startTimer() {
    Timer(const Duration(seconds: 4), () {
      Get.offAllNamed(RouteName.loginScreen);
    });
  }
}
