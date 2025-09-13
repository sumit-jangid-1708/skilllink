import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:skill_link/res/colors/app_color.dart';
import 'package:skill_link/view/auth_screens/signup_screen.dart';
import 'package:skill_link/view/dashboard/dashboard.dart';
import 'package:skill_link/view_models/controller/auth/login_controller.dart';

import '../../res/routes/routes_names.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          SizedBox(
             width: size.width,
            height: size.height,
            child: Image.asset(
              'assets/images/loginSignup.png',
              fit: BoxFit.cover, // Fill completely
            ),
          ),
          
          // ✅ Fullscreen background image with no gaps
          // Positioned.fill(
          //   child: Image.asset(
          //     'assets/images/loginSignup.png',
          //     fit: BoxFit.cover, // cover fills completely
          //   ),
          // ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 100),

                  // Container(
                  //   width: 100,
                  //   height: 100,

                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(50),
                  //     color: const Color.fromARGB(255, 255, 196, 107),
                  //   ),
                  // ),

                  // const SizedBox(height: 16),

                  Text(
                    "Login Account",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Hii, Welcome back, You've been missed",
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 40),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Phone Number",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  IntlPhoneField(
                    decoration: const InputDecoration(
                      hintText: 'Enter Phone number',
                      fillColor: Color(0xFFF2F2F2),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                    initialCountryCode: 'IN',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),

                  const SizedBox(height: 8),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Enter Password',
                      filled: true,
                      fillColor: const Color(0xFFF2F2F2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(()=> DashboardScreen());
                        print("Login button clicked");
                        },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                            color: AppColor.white
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't Have an Account?",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(width: 4),
                      InkWell(
                        onTap: (){
                          print("Sign up button clicked");
                          Get.toNamed(RouteName.signupScreen);
                        },
                        child: const Text(
                          'Create Account',
                          style: TextStyle(
                            color:AppColor.darkGrey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // return Scaffold(
            //   body: SizedBox.expand(
            //     child: Stack(
            //       children: [
            //         // ✅ Fullscreen background image with no gaps
            //         Positioned.fill(
            //           child: Image.asset(
            //             'assets/images/loginSignup.png',
            //             fit: BoxFit.cover, // cover fills completely
            //           ),
            //         ),

            //         Positioned(
            //           top: 80,
            //           left: 60,
            //           child: Container(
            //             width: 100,
            //             height: 100,

            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(50),
            //               color: const Color.fromARGB(255, 255, 196, 107),
            //             ),
            //           ),
            //         ),

            //         Positioned(
            //           top: 105,
            //           left: 90,
            //           child: Column(
            //             children: [
            //               Text("Login Account", style: TextStyle(fontSize: 36)),
            //               SizedBox(height: 22),
            //               Text(
            //                 "Hii, Welcome back, You've been missed",
            //                 style: TextStyle(fontSize: 12),
            //               ),
            //             ],
            //           ),
            //         ),

            //         Padding(
            //           padding: const EdgeInsets.symmetric(horizontal: 24.0),
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               const Align(
            //                 alignment: Alignment.centerLeft,
            //                 child: Text(
            //                   'Phone Number',
            //                   style: TextStyle(
            //                     fontSize: 16,
            //                     fontWeight: FontWeight.w600,
            //                   ),
            //                 ),
            //               ),
            //               const SizedBox(height: 8),
            //               IntlPhoneField(
            //                 decoration: const InputDecoration(
            //                   hintText: 'Enter Phone number',
            //                   fillColor: Color(0xFFF2F2F2),
            //                   filled: true,
            //                   border: OutlineInputBorder(
            //                     borderRadius: BorderRadius.all(Radius.circular(12)),
            //                     borderSide: BorderSide.none,
            //                   ),
            //                 ),
            //                 initialCountryCode: 'IN',
            //                 onChanged: (phone) {
            //                   print(phone.completeNumber);
            //                 },
            //               ),
            //               // const SizedBox(height: 10),
            //               const Align(
            //                 alignment: Alignment.centerLeft,
            //                 child: Text(
            //                   'Password',
            //                   style: TextStyle(
            //                     fontSize: 16,
            //                     fontWeight: FontWeight.w600,
            //                   ),
            //                 ),
            //               ),
            //               const SizedBox(height: 8),
            //               TextField(
            //                 obscureText: true,
            //                 decoration: InputDecoration(
            //                   hintText: 'Enter Password',
            //                   filled: true,
            //                   fillColor: const Color(0xFFF2F2F2),
            //                   border: OutlineInputBorder(
            //                     borderRadius: BorderRadius.circular(12),
            //                     borderSide: BorderSide.none,
            //                   ),
            //                 ),
            //               ),
            //               const SizedBox(height: 24),
            //               SizedBox(
            //                 width: double.infinity,
            //                 height: 50,
            //                 child: ElevatedButton(
            //                   onPressed: () {},
            //                   style: ElevatedButton.styleFrom(
            //                     backgroundColor: Colors.orange,
            //                     shape: RoundedRectangleBorder(
            //                       borderRadius: BorderRadius.circular(30),
            //                     ),
            //                   ),
            //                   child: const Text(
            //                     'Login',
            //                     style: TextStyle(
            //                       fontSize: 18,
            //                       fontWeight: FontWeight.bold,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //               const SizedBox(height: 16),
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: const [
            //                   Text(
            //                     "Don't Have an Account?",
            //                     style: TextStyle(color: Colors.grey),
            //                   ),
            //                   SizedBox(width: 4),
            //                   Text(
            //                     'Create Account',
            //                     style: TextStyle(
            //                       color: Colors.orange,
            //                       fontWeight: FontWeight.bold,
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // );
          ),
        ],
      ),
    );
  }
}






// Center(
            //   child: Form(
            //     key: _formKey,
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Text("Phone Number"),
            //         IntlPhoneField(
            //           decoration: InputDecoration(
            //             labelText: 'Phone Number',
            //             border: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(20),
            //               borderSide: BorderSide(),
            //             ),
            //           ),
            //           initialCountryCode: 'IN',
            //           onChanged: (phone) {
            //             print(phone.completeNumber);
            //           },
            //         ),
            //         Text("Password"),
            //         TextFormField(
            //           decoration: InputDecoration(
            //             labelText: "Enter your password",
            //             border: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(20),
            //               borderSide: BorderSide(),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),