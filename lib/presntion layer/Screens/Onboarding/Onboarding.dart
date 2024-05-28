import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/presntion%20layer/Screens/Onboarding/first_screen.dart';
import 'package:voting/presntion%20layer/Screens/Onboarding/fourth_screen.dart';
import 'package:voting/presntion%20layer/Screens/Onboarding/second_screen.dart';
import 'package:voting/presntion%20layer/Screens/Onboarding/thrird_screen.dart';

class onboarding extends StatefulWidget {
  const onboarding({super.key});

  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  final PageController _controller = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFFC8E6E0),
                  Color(0xFFBBCDCA),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.4, 0.7])),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: PageView(
                controller: _controller,
                children: const [
                  OnboardingScreen1(),
                  OnboardingScreen2(),
                  OnboardingScreen3(),
                  OnboardingScreen4(),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 4,
              effect: SwapEffect(
                activeDotColor: AppColors.mainColor,
                dotColor: Colors.white,
                spacing: 5,
                dotHeight: 6,
                dotWidth: 6,
              ),
              onDotClicked: (index) {
                _controller.animateToPage(index,
                    duration: const Duration(microseconds: 500),
                    curve: Curves.easeIn);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.024,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const OnboardingScreen3(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: AppColors.borderColor),
                    ),
                  ),
                  fixedSize: MaterialStateProperty.all<Size>(
                    Size(MediaQuery.of(context).size.width * 0.64,
                        MediaQuery.of(context).size.height * 0.053),
                  ),
                ),
                child: Text(
                  'Next',
                  style: AppFonts.regularText(context, 16, AppColors.mainColor),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.001,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const OnboardingScreen4()),
                );
              },
              child: Text(
                'Skip',
                style: AppFonts.regularText(
                    context, 16, AppColors.secondaryTextColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
