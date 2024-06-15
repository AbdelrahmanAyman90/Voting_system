// import 'package:flutter/material.dart';
// import 'package:voting/Shared/Colors.dart';
// import 'package:voting/Shared/shard%20local/function_helper.dart';
// import 'package:voting/generated/l10n.dart';
// import 'package:voting/presntion%20layer/Screens/Onboarding/Custom_Onboarding/shared_onboarding.dart';
// import 'package:voting/presntion%20layer/Screens/Onboarding/first_screen.dart';
// import 'package:voting/presntion%20layer/Screens/Onboarding/fourth_screen.dart';
// import 'package:voting/presntion%20layer/Screens/Onboarding/second_screen.dart';
// import 'package:voting/presntion%20layer/Screens/Onboarding/thrird_screen.dart';

// class CustomSecondScreenBody extends StatelessWidget {
//   const CustomSecondScreenBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: const BoxDecoration(
//             gradient: LinearGradient(
//                 colors: [Color(0xFFCAD4C3), Color(0xFFFFEBD8)],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 stops: [
//                   0.4,
//                   0.6,
//                 ])),
//         child: Column(
//           children: [
//             SizedBox(
//               height: MediaQuery.sizeOf(context).height * 100 / 812,
//             ),
//             OnboardingContent(
//                 img: 'assets/images/Group 651.png',
//                 tittle: S.of(context).onboarding2_title,
//                 tittle2: S.of(context).onboarding2_title2,
//                 desc: S.of(context).onboarding2_desc),
//             SizedBox(
//               height: isEnglish() ? 65 : 45,
//             ),
// //////////////////////////  DOTS //////////////////////////////////////////////////////
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Dots(
//                     color: Colors.white, mainScreen: OnboardingScreen1()),
//                 Dots(
//                     color: AppColors.mainColor,
//                     mainScreen: const OnboardingScreen2()),
//                 //for (int i = 0; i < 2; i++)
//                 const Dots(
//                   color: Colors.white,
//                   mainScreen: OnboardingScreen3(),
//                 ),
//                 const Dots(
//                     color: Colors.white, mainScreen: OnboardingScreen4()),
//               ],
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             const CustomNextButton(
//               nextScreen: OnboardingScreen3(),
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             const SkipBtn()
//           ],
//         ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Onboarding/Custom_Onboarding/shared_onboarding.dart';

class CustomSecondScreenBody extends StatelessWidget {
  const CustomSecondScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              height: MediaQuery.sizeOf(context).height < 750
                  ? MediaQuery.sizeOf(context).height * 60 / 812
                  : MediaQuery.sizeOf(context).height * 90 / 812,
            ),
            OnboardingContent(
                img: 'assets/images/Group 651.png',
                tittle: S.of(context).onboarding2_title,
                tittle2: S.of(context).onboarding2_title2,
                desc: S.of(context).onboarding2_desc),
            SizedBox(
              height: isEnglish() ? 58 : 40,
            ),
          ],
        ));
  }
}
