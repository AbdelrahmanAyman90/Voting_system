// import 'package:flutter/material.dart';
// import 'package:voting/Shared/Colors.dart';
// import 'package:voting/Shared/shard%20local/function_helper.dart';
// import 'package:voting/generated/l10n.dart';
// import 'package:voting/presntion%20layer/Screens/Onboarding/Custom_Onboarding/shared_onboarding.dart';
// import 'package:voting/presntion%20layer/Screens/Onboarding/first_screen.dart';
// import 'package:voting/presntion%20layer/Screens/Onboarding/fourth_screen.dart';
// import 'package:voting/presntion%20layer/Screens/Onboarding/second_screen.dart';
// import 'package:voting/presntion%20layer/Screens/Onboarding/thrird_screen.dart';

// class CustomFirstScreenBody extends StatelessWidget {
//   const CustomFirstScreenBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//           gradient: LinearGradient(
//               colors: [Color(0xFFC8E6E0), Color(0xFFBBCDCA)],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               stops: [
//                 0.4,
//                 0.7,
//               ])),
//       child: Column(
//         children: [
//           SizedBox(
//             height: MediaQuery.sizeOf(context).height * 100 / 812,
//           ),
//           OnboardingContent(
//               img: 'assets/images/Group 632.png',
//               tittle: S.of(context).onboarding1_title,
//               desc: S.of(context).onboarding1_desc),
//           SizedBox(
//             height: isEnglish() ? 50 : 55,
//           ),

// ///////////////// DOTS
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Dots(
//                 color: AppColors.mainColor,
//                 mainScreen: const OnboardingScreen1(),
//               ),
//               //for (int i = 0; i < 3; i++)
//               const Dots(color: Colors.white, mainScreen: OnboardingScreen2()),
//               const Dots(color: Colors.white, mainScreen: OnboardingScreen3()),
//               const Dots(color: Colors.white, mainScreen: OnboardingScreen4()),
//             ],
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           const CustomNextButton(
//             nextScreen: OnboardingScreen2(),
//           ),

//           const SizedBox(
//             height: 5,
//           ),
//           const SkipBtn(),
//           const SizedBox(
//             height: 10,
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Onboarding/Custom_Onboarding/shared_onboarding.dart';

class CustomFirstScreenBody extends StatelessWidget {
  const CustomFirstScreenBody({super.key});

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
                : MediaQuery.sizeOf(context).height * 100 / 812,
          ),
          OnboardingContent(
              img: 'assets/images/Group 632.png',
              tittle: S.of(context).onboarding1_title,
              desc: S.of(context).onboarding1_desc),
          SizedBox(
            height: isEnglish() ? 45 : 50,
          ),
        ],
      ),
    );
  }
}
