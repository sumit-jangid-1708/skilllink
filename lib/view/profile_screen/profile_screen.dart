import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_link/utils/curved_background.dart';

import '../../res/colors/app_color.dart' show AppColor;

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CurvedBackground(
        child: SafeArea(
          child: SingleChildScrollView(child:
          Padding(padding: EdgeInsets.symmetric( horizontal: 25, vertical: 10),
         child: Column(
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){Get.back();},
                      child: Container(
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
                            child: Icon(Icons.arrow_back, color: Colors.black54, )
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){},
                      child: Container(
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
                            child: Icon(Icons.settings, color: Colors.black54, )
                          ),
                        ),
                      ),
                    ),
                  ],
                )

              ],
            ),
          )),
        ),
      ),
    );
  }
}
