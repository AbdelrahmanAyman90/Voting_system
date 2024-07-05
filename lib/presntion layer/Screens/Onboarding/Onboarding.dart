import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Onboarding/Custom_Onboarding/shared_onboarding.dart';
import 'package:voting/presntion%20layer/Screens/Onboarding/first_screen.dart';
import 'package:voting/presntion%20layer/Screens/Onboarding/fourth_screen.dart';
import 'package:voting/presntion%20layer/Screens/Onboarding/second_screen.dart';
import 'package:voting/presntion%20layer/Screens/Onboarding/thrird_screen.dart';
import 'package:voting/presntion%20layer/Screens/Register&Login/register_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController(initialPage: 0);
  bool lastPage = false;

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
                onPageChanged: (value) {
                  setState(() {
                    lastPage = value == 3;
                  });
                },
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
              effect: SlideEffect(
                activeDotColor: AppColors.mainColor,
                dotColor: Colors.white,
                spacing: 5,
                dotHeight: 8,
                dotWidth: 8,
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
            lastPage
                ? Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      CustomNextButton(
                        text: S.of(context).lets_go,
                        textColor: Colors.white,
                        buttonColor: AppColors.mainColor,
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const RegisterScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  )
                : Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      CustomNextButton(
                        onPressed: () => _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SkipBtn(
                        onPressed: () => _controller.jumpToPage(3),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
