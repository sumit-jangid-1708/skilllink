import 'package:get/get.dart';
import 'package:skill_link/res/routes/routes_names.dart';
import 'package:skill_link/view/auth_screens/login_screen.dart';
import 'package:skill_link/view/dashboard/dashboard.dart';
import 'package:skill_link/view/home/categories_screen.dart';
import 'package:skill_link/view/profile_screen/edit_profile_screen.dart';
import 'package:skill_link/view/home/worker_profile_screen.dart';
import 'package:skill_link/view/home/request_service_screen.dart';
import 'package:skill_link/view/home/request_details_screen.dart';
import 'package:skill_link/view/splash_screen/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
    GetPage(
      name: RouteName.splashScreen,
      page: () => const SplashScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RouteName.loginScreen,
      page: () => LoginScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: RouteName.dashboardScreen,
      page: () => DashboardScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RouteName.categoriesScreen,
      page: () => const CategoriesScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: RouteName.editProfileScreen,
      page: () => EditProfileScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: RouteName.workerProfileScreen,
      page: () => WorkerProfileScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: RouteName.requestServiceScreen,
      page: () => RequestServiceScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: RouteName.requestDetailsScreen,
      page: () => const RequestDetailsScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
  ];
}
