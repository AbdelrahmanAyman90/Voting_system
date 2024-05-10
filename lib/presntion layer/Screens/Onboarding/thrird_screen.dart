import 'package:flutter/material.dart';
import 'package:voting/presntion%20layer/Screens/Onboarding/Custom_Onboarding/custom_third_screen_body.dart';

class OnboardingScreen3 extends StatefulWidget {
  const OnboardingScreen3({super.key});

  @override
  State<OnboardingScreen3> createState() => _OnboardingScreen3State();
}

class _OnboardingScreen3State extends State<OnboardingScreen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MediaQuery.sizeOf(context).height < 700
            ? const SingleChildScrollView(
                scrollDirection: Axis.vertical, child: CustomThirdScreenBody())
            : const CustomThirdScreenBody());
  }
}
