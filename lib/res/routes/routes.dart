import 'package:get/get.dart';
import 'package:skill_link/res/routes/routes_names.dart';
import 'package:skill_link/view/auth_screens/signup_screen.dart';
import 'package:skill_link/view/dashboard/dashboard.dart';
import 'package:skill_link/view/home/home_screen.dart';
import 'package:skill_link/view/profile_screen/profile_screen.dart';
import 'package:skill_link/view/splash_screen.dart';
import 'package:skill_link/view/star_screen/star_screen.dart';

import '../../view/auth_screens/login_screen.dart';
import '../../view/booking_screen/booking_screen.dart';
import '../../view/map_screen/map_screen.dart';

class AppRoutes {
  static appRoutes() => [
    GetPage(
      name: RouteName.splashScreen,
      page: () => SplashScreen(),
      transitionDuration: Duration(microseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.loginScreen,
      page: () => LoginScreen(),
      transitionDuration: Duration(microseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.signupScreen,
      page: () => SignupScreen(),
      transitionDuration: Duration(microseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.dashboardScreen,
      page: () => DashboardScreen(),
      transitionDuration: Duration(microseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.homeScreen,
      page: () => HomeScreen(),
      transitionDuration: Duration(microseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.mapScreen,
      page: () => MapScreen(),
      transitionDuration: Duration(microseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.bookingScreen,
      page: () => BookingScreen(),
      transitionDuration: Duration(microseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.starScreen,
      page: () => StarScreen(),
      transitionDuration: Duration(microseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.profileScreen,
      page: () => ProfileScreen(),
      transitionDuration: Duration(microseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
  ];
}
