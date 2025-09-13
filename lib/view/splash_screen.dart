import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_link/res/colors/app_color.dart';
import 'package:skill_link/view_models/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  SplashServices splashScreen = SplashServices();

  late AnimationController _logoController;
  late Animation<double> _logoAnimation;

  late AnimationController _spinnerController;
  late Animation<double> _spinnerAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize logo fade-in animation
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _logoAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_logoController);

    // Initialize spinner fade-in animation
    _spinnerController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _spinnerAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_spinnerController);

    // Start animations
    _logoController.forward();
    Future.delayed(const Duration(seconds: 2), () {
      _spinnerController.forward();
    });

    // Navigate after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      splashScreen.isLogin();
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _spinnerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _logoAnimation,
              child: Image.asset(
                'assets/images/App logo.png',  // make sure the path is correct
                height: size.height * 0.2,
                width: size.width * 0.4,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            FadeTransition(
              opacity: _spinnerAnimation,
            ),
          ],
        ),
      ),
    );
  }
}
