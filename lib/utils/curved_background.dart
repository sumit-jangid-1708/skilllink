import 'package:flutter/material.dart';
import '../res/colors/app_color.dart';

class CurvedBackground extends StatelessWidget {
  final Widget child;

  const CurvedBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFFB64D), // light orange-yellow (top)
            Color(0xFFFDEFCD),// pale warm yellow (bottom)
            Color(0xFFF8F7F5),
          ],
        ),
      ),
      child: child,
    );
  }
}
