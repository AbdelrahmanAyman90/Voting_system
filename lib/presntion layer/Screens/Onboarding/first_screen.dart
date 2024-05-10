import 'package:flutter/material.dart';
import 'package:voting/presntion%20layer/Screens/Onboarding/Custom_Onboarding/custom_first_screen_body.dart';

class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({
    super.key,
  });

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.sizeOf(context).height < 700
          ? const SingleChildScrollView(
              scrollDirection: Axis.vertical, child: CustomFirstScreenBody())
          : const CustomFirstScreenBody(),
    );
  }
}
