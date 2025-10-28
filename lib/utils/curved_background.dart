import 'package:flutter/material.dart';

import '../res/colors/app_color.dart';

class CurvedBackground extends StatelessWidget {
  final Widget child;

  const CurvedBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Orange half-circle
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            decoration: const BoxDecoration(
              color: AppColor.red,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
        ),

        // Small rounded bar
        // Positioned(
        //   top: 180,
        //   left: MediaQuery.of(context).size.width / 2 - 20,
        //   child: Container(
        //     width: 40,
        //     height: 6,
        //     decoration: BoxDecoration(
        //       // color: Colors.orange.shade700,
        //       color: Colors.white,
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //   ),
        // ),

        // Screen content
        Positioned.fill(child: child),
      ],
    );
  }
}
