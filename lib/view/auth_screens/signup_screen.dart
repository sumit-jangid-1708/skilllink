// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:skill_link/res/colors/app_color.dart';
// import 'package:skill_link/view/auth_screens/login_screen.dart';
// import 'package:skill_link/view/dashboard/dashboard.dart';
//
// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});
//
//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }
//
// class _SignupScreenState extends State<SignupScreen> {
//   final RxBool hidePassword = true.obs;
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//
//     return Scaffold(
//       backgroundColor: AppColor.background,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             /// TOP GRADIENT BACKGROUND
//             Container(
//               height: size.height * 0.35,
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     AppColor.gradientStart,
//                     AppColor.gradientEnd,
//                   ],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//               ),
//             ),
//
//             /// MAIN CONTENT
//             SingleChildScrollView(
//               child: Column(
//                 children: [
//                   const SizedBox(height: 25),
//
//                   /// ILLUSTRATION IMAGE
//                   SizedBox(
//                     height: 230,
//                     child: Image.asset("assets/images/service.png"),
//                   ),
//
//                   /// WHITE CARD
//                   Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.all(20),
//                     margin: const EdgeInsets.symmetric(horizontal: 20),
//                     decoration: BoxDecoration(
//                       color: AppColor.cardBackground,
//                       borderRadius: BorderRadius.circular(22),
//                       border: Border.all(color: AppColor.grey200, width: 1),
//                       boxShadow: [
//                         BoxShadow(
//                           color: AppColor.black.withOpacity(0.05),
//                           blurRadius: 10,
//                           spreadRadius: 2,
//                           offset: const Offset(0, 5),
//                         ),
//                       ],
//                     ),
//
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         /// Title
//                         const Text(
//                           "Create Account",
//                           style: TextStyle(
//                             fontSize: 28,
//                             fontWeight: FontWeight.bold,
//                             color: AppColor.textPrimary,
//                           ),
//                         ),
//                         const SizedBox(height: 4),
//                         const Text(
//                           "Sign up to start using SkillLink",
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: AppColor.textSecondary,
//                           ),
//                         ),
//
//                         const SizedBox(height: 25),
//
//                         /// NAME
//                         const Text(
//                           "Full Name",
//                           style: TextStyle(
//                               fontSize: 15, fontWeight: FontWeight.w600, color: AppColor.textPrimary),
//                         ),
//                         const SizedBox(height: 8),
//                         TextField(
//                           decoration: InputDecoration(
//                             hintText: "Enter your name",
//                             hintStyle: const TextStyle(color: AppColor.textHint),
//                             filled: true,
//                             fillColor: AppColor.grey50,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                               borderSide: const BorderSide(color: AppColor.grey200),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                               borderSide: const BorderSide(color: AppColor.grey200),
//                             ),
//                           ),
//                         ),
//
//                         const SizedBox(height: 15),
//
//                         /// PHONE
//                         const Text(
//                           "Phone Number",
//                           style: TextStyle(
//                               fontSize: 15, fontWeight: FontWeight.w600, color: AppColor.textPrimary),
//                         ),
//                         const SizedBox(height: 8),
//                         IntlPhoneField(
//                           decoration: InputDecoration(
//                             hintText: "Enter phone number",
//                             hintStyle: const TextStyle(color: AppColor.textHint),
//                             filled: true,
//                             fillColor: AppColor.grey50,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                               borderSide: const BorderSide(color: AppColor.grey200),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                               borderSide: const BorderSide(color: AppColor.grey200),
//                             ),
//                           ),
//                           initialCountryCode: "IN",
//                         ),
//
//                         const SizedBox(height: 15),
//
//                         /// PASSWORD
//                         const Text(
//                           "Password",
//                           style: TextStyle(
//                               fontSize: 15, fontWeight: FontWeight.w600, color: AppColor.textPrimary),
//                         ),
//                         const SizedBox(height: 8),
//
//                         Obx(() => TextField(
//                           obscureText: hidePassword.value,
//                           decoration: InputDecoration(
//                             hintText: "Enter Password",
//                             hintStyle: const TextStyle(color: AppColor.textHint),
//                             filled: true,
//                             fillColor: AppColor.grey50,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                               borderSide: const BorderSide(color: AppColor.grey200),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                               borderSide: const BorderSide(color: AppColor.grey200),
//                             ),
//                             suffixIcon: IconButton(
//                               icon: Icon(
//                                 hidePassword.value
//                                     ? Icons.visibility_off
//                                     : Icons.visibility,
//                                 color: AppColor.grey400,
//                               ),
//                               onPressed: () {
//                                 hidePassword.value = !hidePassword.value;
//                               },
//                             ),
//                           ),
//                         )),
//
//                         const SizedBox(height: 25),
//
//                         /// SIGNUP BUTTON
//                         SizedBox(
//                           width: double.infinity,
//                           height: 52,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               Get.to(() => DashboardScreen());
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: AppColor.primary,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(14),
//                               ),
//                             ),
//                             child: const Text(
//                               "Sign Up",
//                               style: TextStyle(
//                                 color: AppColor.white,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                           ),
//                         ),
//
//                         const SizedBox(height: 20),
//
//                         /// LOGIN LINK
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Text(
//                               "Already have an account?",
//                               style: TextStyle(
//                                 color: AppColor.textSecondary,
//                                 fontSize: 14,
//                               ),
//                             ),
//                             InkWell(
//                               onTap: () => Get.to(() => LoginScreen()),
//                               child: const Text(
//                                 "  Login",
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.bold,
//                                   color: AppColor.primary,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//
//                         const SizedBox(height: 15),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
