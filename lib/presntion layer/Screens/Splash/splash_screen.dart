// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:voting/presntion%20layer/Screens/Onboarding/first_screen.dart';
// import 'package:voting/Shared/Colors.dart';
// import 'package:voting/presntion%20layer/Screens/Splash/Custom_Splash_Widgets/custom_splash_body.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with TickerProviderStateMixin {
//   late AnimationController _img1;
//   late AnimationController _img2;

//   @override
//   void initState() {
//     super.initState();
//     _img1 = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 900));
//     _img1.forward();
//     _img2 = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 1500));
//     _img2.forward();
//   }

//   @override
//   void dispose() {
//     _img1.dispose();
//     _img2.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSplashScreen(
//       splash: Center(
//         child: SizedBox(
//             width: double.infinity,
//             //height: MediaQuery.of(context).size.height * 60 / 812,
//             child: CustomSplashBody(img1: _img1, img2: _img2)),
//       ),
//       backgroundColor: AppColors.mainColor,
//       nextScreen: const OnboardingScreen1(),
//       duration: 3000,
//       animationDuration: const Duration(seconds: 1),
//       splashTransition: SplashTransition.fadeTransition,
//       pageTransitionType: PageTransitionType.fade,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:voting/presntion%20layer/Screens/Splash/Custom_Splash_Widgets/custom_splash_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CustomSplashBody());
  }
}
