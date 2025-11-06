import 'package:flutter/material.dart';
import '../res/colors/app_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String initial;
  final VoidCallback? onProfileTap;
  final VoidCallback? onNotificationTap;

  const CustomAppBar({
    super.key,
    required this.initial,
    this.onProfileTap,
    this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Color(0xFFFFB64D),
        // gradient: LinearGradient(
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        //   colors: [
        //     Color(0xFFFFB64D), // Same as CurvedBackground top color
        //     Color(0xFFFFE7B3), // Bottom blend for smooth transition
        //   ],
        // ),
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Profile Box
            GestureDetector(
              onTap: onProfileTap,
              child: Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), // Rounded square
                  color: AppColor.white,
                ),
                child: Center(
                  child: Text(
                    initial.toUpperCase(),
                    style: TextStyle(
                      fontSize: 22,
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            // Notification Box
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
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
