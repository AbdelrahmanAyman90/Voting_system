import 'package:flutter/material.dart';
import 'package:voting/presntion%20layer/Screens/Onboarding/Custom_Onboarding/custom_fourth_screen_body.dart';

class OnboardingScreen4 extends StatelessWidget {
  const OnboardingScreen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MediaQuery.sizeOf(context).height < 670
            ? const SingleChildScrollView(
                scrollDirection: Axis.vertical, child: CustomFourthScreenBody())
            : const CustomFourthScreenBody());
  }
}