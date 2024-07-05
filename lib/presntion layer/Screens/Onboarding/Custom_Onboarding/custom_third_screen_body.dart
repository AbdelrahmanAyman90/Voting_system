// import 'package:flutter/material.dart';
// import 'package:voting/Shared/Colors.dart';
// import 'package:voting/Shared/shard%20local/function_helper.dart';
// import 'package:voting/generated/l10n.dart';
// import 'package:voting/presntion%20layer/Screens/Onboarding/Custom_Onboarding/shared_onboarding.dart';
// import 'package:voting/presntion%20layer/Screens/Onboarding/first_screen.dart';
// import 'package:voting/presntion%20layer/Screens/Onboarding/fourth_screen.dart';
// import 'package:voting/presntion%20layer/Screens/Onboarding/second_screen.dart';
// import 'package:voting/presntion%20layer/Screens/Onboarding/thrird_screen.dart';

// class CustomThirdScreenBody extends StatelessWidget {
//   const CustomThirdScreenBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: const BoxDecoration(
//             gradient: LinearGradient(
//                 colors: [
//                   Color.fromARGB(255, 199, 240, 203),
//                   Color.fromARGB(255, 144, 197, 170)
//                 ],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 stops: [
//                   0.2,
//                   0.6,
//                 ])),
//         child: Column(
//           children: [
//             SizedBox(
//               height: isEnglish()
//                   ? MediaQuery.sizeOf(context).height * 80 / 812
//                   : MediaQuery.sizeOf(context).height * 100 / 812,
//             ),
//             OnboardingContent(
//                 img: 'assets/images/Group 636.png',
//                 tittle: S.of(context).onboarding3_title,
//                 tittle2: S.of(context).onboarding3_title2,
//                 desc: S.of(context).onboarding3_desc),
//             SizedBox(
//               height: isEnglish()
//                   ? MediaQuery.sizeOf(context).height * 80 / 812
//                   : MediaQuery.sizeOf(context).height * 75 / 812,
//             ),
// /////////////////////////////// DOTS   /////////////////////////////////////////////////
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 //for (int i = 0; i < 2; i++)
//                 const Dots(
//                     color: Colors.white, mainScreen: OnboardingScreen1()),
//                 const Dots(
//                     color: Colors.white, mainScreen: OnboardingScreen2()),
//                 Dots(
//                     color: AppColors.mainColor,
//                     mainScreen: const OnboardingScreen3()),
//                 const Dots(
//                     color: Colors.white, mainScreen: OnboardingScreen4()),
//               ],
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             const CustomNextButton(
//               nextScreen: OnboardingScreen4(),
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

class CustomThirdScreenBody extends StatelessWidget {
  const CustomThirdScreenBody({super.key});

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
                img: 'assets/images/Group 636.png',
                tittle: S.of(context).onboarding3_title,
                tittle2: S.of(context).onboarding3_title2,
                desc: S.of(context).onboarding3_desc),
            SizedBox(
              height: isEnglish()
                  ? MediaQuery.sizeOf(context).height * 70 / 812
                  : MediaQuery.sizeOf(context).height * 75 / 812,
            ),
          ],
        ));
  }
}