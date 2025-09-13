import 'dart:async';
import 'package:get/get.dart';
import 'package:skill_link/res/routes/routes_names.dart';
import 'package:skill_link/view_models/controller/user_preferences/user_preferences.dart';


class SplashServices {
  final UserPreferences _userPreferences = UserPreferences();

  Future<void> isLogin() async {
    final user = await _userPreferences.getUser();
    if (user.isLogin == true && user.token != null && user.token!.isNotEmpty) {
      Get.toNamed(RouteName.homeScreen);
    } else {
      Get.toNamed(RouteName.loginScreen);
    }
  }
}
