import 'package:flutter/material.dart';
import 'package:voting/presntion%20layer/Screens/Onboarding/Custom_Onboarding/custom_second_screen_body.dart';

class OnboardingScreen2 extends StatefulWidget {
  const OnboardingScreen2({super.key});

  @override
  State<OnboardingScreen2> createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MediaQuery.sizeOf(context).height < 700
            ? const SingleChildScrollView(
                scrollDirection: Axis.vertical, child: CustomSecondScreenBody())
            : const CustomSecondScreenBody());
  }
}