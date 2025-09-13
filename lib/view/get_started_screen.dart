// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:skill_link/res/colors/app_color.dart';
// import 'package:skill_link/res/routes/routes_names.dart';

// class GetStartedScreen extends StatelessWidget {
//   const GetStartedScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           // Background Image
//           Image.asset(
//             'assets/images/get started banner.png', // <-- your background image path
//             fit: BoxFit.cover,
//           ),

//           // Content on top of background
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Welcome to SkillLink',
//                   style: TextStyle(
//                     fontSize: size.height * 0.04,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: size.height * 0.02),
//                 Text(
//                   'Find the best skills and grow your career with us.',
//                   style: TextStyle(
//                     fontSize: size.height * 0.022,
//                     color: Colors.white70,
//                   ),
//                 ),
//                 SizedBox(height: size.height * 0.35), // Push button down
//                 Container(
//                   width: double.infinity,
//                   height: size.height * 0.12,
//                   decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.2),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Center(
//                     child: GestureDetector(
//                       onTap: () {
//                         Get.toNamed(RouteName.loginScreen);
//                       },
//                       child: Container(
//                         height: size.height * 0.08,
//                         width: size.height * 0.08,
//                         decoration: BoxDecoration(
//                           color: AppColor.mainColor,
//                           shape: BoxShape.circle,
//                         ),
//                         child: Center(
//                           child: Icon(
//                             Icons.arrow_forward,
//                             color: Colors.white,
//                             size: size.height * 0.04,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
