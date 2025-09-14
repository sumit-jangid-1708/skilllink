import 'package:flutter/material.dart';
import 'package:skill_link/res/colors/app_color.dart';

import '../../utils/curved_background.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CurvedBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          // border: BoxBorder.all(width: 1, color: AppColor.blackColor),
                          color: AppColor.white,
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "S",
                              style: TextStyle(
                                fontSize: 22,
                                color: AppColor.mainColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          // border: BoxBorder.all(width: 1, color: AppColor.blackColor),
                          color: AppColor.white,
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                Icon(
                                  Icons.notifications,
                                  color: AppColor.mainColor,
                                  size: 30,
                                ),

                                Positioned(
                                  left: 18,
                                  top: 4,
                                  child: Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      // border: BoxBorder.all(width: 1, color: AppColor.blackColor),
                                      color: AppColor.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 130),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Special For You",
                      style: TextStyle(
                        fontSize: 22,
                        color: AppColor.blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(onPressed: () {}, child: Text("See All", style: TextStyle(
                      fontSize: 15,
                      color: AppColor.mainColor,
                      fontWeight: FontWeight.bold,
                    ),)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
