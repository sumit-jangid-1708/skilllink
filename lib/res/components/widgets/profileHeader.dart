import 'package:flutter/material.dart';
import 'package:skill_link/res/colors/app_color.dart';

class ProfileHeader extends StatelessWidget {
  final String avatarPath;
  final String name;
  final String email;

  const ProfileHeader({
    Key? key,
    required this.avatarPath,
    required this.name,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(  // ✅ Fix infinite width issue
      // width: MediaQuery.of(context).size.width, // screen width ke equal
      child: Container(
        decoration: BoxDecoration(
          // color: Colors.orange,
          // borderRadius: BorderRadius.only(
          //   bottomLeft: Radius.circular(40),
          //   bottomRight: Radius.circular(40),
          // ),
          borderRadius: BorderRadius.circular(50),
        ),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
        child: Column(
          children: [
            // Avatar
            CircleAvatar(
              backgroundColor: AppColor.white,
              radius: 40,
              backgroundImage: AssetImage("assets/images/avatar.png"),
            ),
            const SizedBox(height: 12),

            // Name
            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            // Email
            Text(
              email,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
