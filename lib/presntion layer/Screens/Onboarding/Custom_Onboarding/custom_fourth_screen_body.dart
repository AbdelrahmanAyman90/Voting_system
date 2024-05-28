import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Home/home_screen.dart';
import 'package:voting/presntion%20layer/Screens/Onboarding/Custom_Onboarding/shared_onboarding.dart';
import 'package:voting/presntion%20layer/Screens/Onboarding/first_screen.dart';
import 'package:voting/presntion%20layer/Screens/Onboarding/fourth_screen.dart';
import 'package:voting/presntion%20layer/Screens/Onboarding/second_screen.dart';
import 'package:voting/presntion%20layer/Screens/Onboarding/thrird_screen.dart';

class CustomFourthScreenBody extends StatelessWidget {
  const CustomFourthScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xFFE3FDF3), Color.fromARGB(255, 134, 217, 166)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 100 / 812,
            ),
            OnboardingContent(
                img: 'assets/images/Group.png',
                img2: 'assets/images/Text_1_.png',
                tittle: S.of(context).onboarding2_title,
                tittle2: S.of(context).onboarding2_title2,
                desc: S.of(context).onboarding2_desc),
            const SizedBox(
              height: 40,
            ),
///////////////////////  DOTS
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //for (int i = 0; i < 3; i++)
                const Dots(
                    color: Colors.white, mainScreen: OnboardingScreen1()),
                const Dots(
                    color: Colors.white, mainScreen: OnboardingScreen2()),
                const Dots(
                    color: Colors.white, mainScreen: OnboardingScreen3()),
                Dots(
                  color: AppColors.mainColor,
                  mainScreen: const OnboardingScreen4(),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomNextButton(
              text: S.of(context).lets_go,
              textColor: Colors.white,
              buttonColor: AppColors.mainColor,
              nextScreen: const HomeScreen(),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ));
  }
}
