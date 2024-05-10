import 'package:flutter/material.dart';
import 'package:voting/presntion%20layer/Screens/Onboarding/fourth_screen.dart';
import 'package:voting/presntion%20layer/Screens/Onboarding/second_screen.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/Fonts.dart';
import 'package:voting/presntion%20layer/Screens/Onboarding/Custom_Onboarding/Onboarding_Page.dart';

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
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFFC8E6E0), Color(0xFFBBCDCA)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
                  0.4,
                  0.7,
                ])),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            const onboarding_page(
                img: 'assets/images/Group 632.png',
                tittle: 'Are you ready to vote?',
                desc:
                    'Welcome to ballotchain, the app that makes voting secure & transparent.Take part in elections,wherever you are.'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.087,
            ),
////////////////////////////////   DOTS  ///////////////////////////////////////////////////////////////////////////
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.015,
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.mainColor),
                  ),
                ),
                for (int i = 0; i < 3; i++)
                  SizedBox(
                    width: MediaQuery.of(context).size.height * 0.015,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ),
                  ),
              ],
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
                          const OnboardingScreen2(),
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
                  style: AppFonts.regularText(
                      fontSize: 16, color: AppColors.mainColor),
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
                    fontSize: 16, color: AppColors.secondaryTextColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
