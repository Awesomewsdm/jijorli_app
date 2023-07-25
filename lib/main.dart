import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'screens/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: SplashScreen(),
    );
  }
}
// 55514417.
// 020 552 0518
// +233 56 142 2378