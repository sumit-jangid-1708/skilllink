import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_link/utils/curved_background.dart';

import '../../res/colors/app_color.dart';

class BookingScreen extends StatelessWidget {
  final VoidCallback? onNotificationTap;
  const BookingScreen({super.key, this.onNotificationTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CurvedBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12), // Rounded square
                            color: AppColor.white,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_back,
                              size: 20, // Optional: fine-tune icon size
                              color: Colors.black, // or AppColor.blackColor if you prefer
                            ),
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: onNotificationTap,
                        child: Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColor.white,
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(
                                Icons.notifications_none_rounded,
                                color: AppColor.blackColor,
                                size: 28,
                              ),
                              Positioned(
                                right: 12,
                                top: 12,
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: AppColor.red,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),

                  Container(
                    width: double.infinity,
                    height: 70,
                    // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFFD580), Color(0xFFFFA726)], // soft orange gradient
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.orangeAccent.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(2, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "Book SkillLink's Professionals",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
