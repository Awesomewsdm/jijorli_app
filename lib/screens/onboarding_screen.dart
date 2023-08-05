import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jijorli_app/constants/image_strings.dart';
import 'package:jijorli_app/screens/chat_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
          child: SizedBox(
              height: size.height,
              width: size.width,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: SizedBox(
                      child: Column(
                        children: [
                          Text(
                            "Your AI Assistant",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 28,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "Using this software, you can ask your questions and receive articles using artificial intelligence assistant",
                            style: TextStyle(
                                color: Color(0xFF757575),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 70),
                  Image.asset(tOnboardingImage1),
                  const Spacer(),
                  ButtonWidget(
                    label: "Continue",
                    onTap: () {
                      Get.to(
                        () =>
                            //       //  SeatBookingScreen(
                            //       //       model: economyseatLayout,
                            //       //     )
                            ChatScreen(),
                      );
                    },
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.onTap,
    required this.label,
  });
  final void Function()? onTap;
  final String label;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue,
        ),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
