import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jijorli_app/constants/image_strings.dart';
import 'package:jijorli_app/screens/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.lightBlue,
        child: Center(
          child: GestureDetector(
              onTap: () => Get.to(() => const OnboardingScreen()),
              child: Image.asset(tAppIcon)),
        ),
      ),
    );
  }
}
