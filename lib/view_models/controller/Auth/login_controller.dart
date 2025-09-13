import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_link/data/repository/login_repository/login_repository.dart';
import 'package:skill_link/models/login/user_response_model.dart';
import 'package:skill_link/res/routes/routes_names.dart';
import 'package:skill_link/utils/utils.dart';
import 'package:skill_link/view_models/controller/user_preferences/user_preferences.dart';


class LoginController extends GetxController {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    // Add your Auth logic here
    print('Phone: ${phoneController.text}, Password: ${passwordController.text}');
    // Navigate to home screen after Auth success
  }
}




// class LoginController extends GetxController {
//   final _api = LoginRepository();

//   UserPreferences userPreferences = UserPreferences();

//   final emailController = TextEditingController().obs;
//   final passwordController = TextEditingController().obs;

//   final emailFocusNode = FocusNode().obs;
//   final passwordFocusNode = FocusNode().obs;

//   RxBool loading = false.obs;

//   // void loginApi() async {
//   //   loading.value = true;

//   //   Map<String, String> data = {
//   //     "email": emailController.value.text,
//   //     "password": passwordController.value.text,
//   //   };

//   //   // try {
//   //   //   final response = await _api.loginApi(data);

//   //   //   if (response['error'] == 'user not found') {
//   //   //     Utils.snackBar("Login", response['error']);
//   //   //   } else if (response['token'] == null || response['token'].isEmpty) {
//   //   //     Utils.snackBar("Login", "Invalid token received");
//   //   //   } else {
//   //   //     UserResponseModel userResponseModel = UserResponseModel(
//   //   //       token: response['token'],
//   //   //       isLogin: true,
//   //   //     );

//   //   //     bool saved = await userPreferences.savedUser(userResponseModel);
//   //   //     if (saved) {
//   //   //       Get.toNamed(RouteName.homeScreen);
//   //   //       Utils.snackBar("Login", "Login Successful");
//   //   //     }
//   //   //   }
//   //   // } catch (error) {
//   //   //   Utils.snackBar('Error', error.toString());
//   //   // } finally {
//   //   //   loading.value = false;
//   //   // }
//   // }

// }

// // {
// //   "page": 1,
// //   "per_page": 12,
// //   "total": 12,
// //   "total_pages": 1,
// //   "data": [
// //     {
// //       "id": 1,
// //       "email": "george.bluth@reqres.in",
// //       "first_name": "George",
// //       "last_name": "Bluth",
// //       "avatar": "https://reqres.in/img/faces/1-image.jpg"
// //     },
// //     {
// //       "id": 2,
// //       "email": "janet.weaver@reqres.in",
// //       "first_name": "Janet",
// //       "last_name": "Weaver",
// //       "avatar": "https://reqres.in/img/faces/2-image.jpg"
// //     },
// //     {
// //       "id": 3,
// //       "email": "emma.wong@reqres.in",
// //       "first_name": "Emma",
// //       "last_name": "Wong",
// //       "avatar": "https://reqres.in/img/faces/3-image.jpg"
// //     },
// //     {
// //       "id": 4,
// //       "email": "eve.holt@reqres.in",
// //       "first_name": "Eve",
// //       "last_name": "Holt",
// //       "avatar": "https://reqres.in/img/faces/4-image.jpg"
// //     },
// //     {
// //       "id": 5,
// //       "email": "charles.morris@reqres.in",
// //       "first_name": "Charles",
// //       "last_name": "Morris",
// //       "avatar": "https://reqres.in/img/faces/5-image.jpg"
// //     },
// //     {
// //       "id": 6,
// //       "email": "tracey.ramos@reqres.in",
// //       "first_name": "Tracey",
// //       "last_name": "Ramos",
// //       "avatar": "https://reqres.in/img/faces/6-image.jpg"
// //     },
// //     {
// //       "id": 7,
// //       "email": "michael.lawson@reqres.in",
// //       "first_name": "Michael",
// //       "last_name": "Lawson",
// //       "avatar": "https://reqres.in/img/faces/7-image.jpg"
// //     },
// //     {
// //       "id": 8,
// //       "email": "lindsay.ferguson@reqres.in",
// //       "first_name": "Lindsay",
// //       "last_name": "Ferguson",
// //       "avatar": "https://reqres.in/img/faces/8-image.jpg"
// //     },
// //     {
// //       "id": 9,
// //       "email": "tobias.funke@reqres.in",
// //       "first_name": "Tobias",
// //       "last_name": "Funke",
// //       "avatar": "https://reqres.in/img/faces/9-image.jpg"
// //     },
// //     {
// //       "id": 10,
// //       "email": "byron.fields@reqres.in",
// //       "first_name": "Byron",
// //       "last_name": "Fields",
// //       "avatar": "https://reqres.in/img/faces/10-image.jpg"
// //     },
// //     {
// //       "id": 11,
// //       "email": "george.edwards@reqres.in",
// //       "first_name": "George",
// //       "last_name": "Edwards",
// //       "avatar": "https://reqres.in/img/faces/11-image.jpg"
// //     },
// //     {
// //       "id": 12,
// //       "email": "rachel.howell@reqres.in",
// //       "first_name": "Rachel",
// //       "last_name": "Howell",
// //       "avatar": "https://reqres.in/img/faces/12-image.jpg"
// //     }
// //   ],
// //   "support": {
// //     "url": "https://contentcaddy.io?utm_source=reqres&utm_medium=json&utm_campaign=referral",
// //     "text": "Tired of writing endless social media content? Let Content Caddy generate it for you."
// //   }
// // }