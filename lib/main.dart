 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_link/res/getx_localization/languages.dart';
import 'package:skill_link/res/routes/routes.dart';
import 'package:skill_link/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      translations: Languages(),
      locale: const Locale('hi', 'IN'),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 249, 232)),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
