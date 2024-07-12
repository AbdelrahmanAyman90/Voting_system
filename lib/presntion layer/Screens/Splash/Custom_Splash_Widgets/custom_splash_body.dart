// import 'package:flutter/material.dart';
// import 'package:voting/Shared/Colors.dart';

// class CustomSplashBody extends StatelessWidget {
//   const CustomSplashBody({super.key, required this.img1, required this.img2});
//   final AnimationController img1;
//   final AnimationController img2;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.mainColor,
//       body: Stack(
//         children: [
//           Positioned(
//             left: MediaQuery.of(context).size.width * 0.2,
//             child: SlideTransition(
//               position: Tween<Offset>(
//                       begin: const Offset(4, 0), end: const Offset(0, 0))
//                   .animate(img1),
//               child: Image.asset('assets/images/Mask group (1).png',
//                   //height: MediaQuery.of(context).size.height * .8,
//                   width: MediaQuery.of(context).size.width * .2),
//             ),
//           ),
//           Positioned(
//             left: MediaQuery.of(context).size.width * 0.26,
//             child: SlideTransition(
//               position: Tween<Offset>(
//                 begin: const Offset(4, 0),
//                 end: const Offset(0, 0),
//               ).animate(img2),
//               child: SizedBox(
//                 height: 55,
//                 child: Image.asset('assets/images/Mask group.png',
//                     //height: MediaQuery.of(context).size.height * .085,
//                     width: MediaQuery.of(context).size.width * .58),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/Shared/const/const_varible.dart';
import 'package:voting/presntion%20layer/Screens/Home/Home_Screen.dart';
import 'package:voting/presntion%20layer/Screens/Onboarding/Onboarding.dart';
import 'package:voting/presntion%20layer/Screens/Register&Login/login_screen.dart';
import 'package:voting/presntion%20layer/Screens/Register&Login/register_screen.dart';

class CustomSplashBody extends StatefulWidget {
  const CustomSplashBody({super.key});

  @override
  State<CustomSplashBody> createState() => _CustomSplashBodyState();
}

class _CustomSplashBodyState extends State<CustomSplashBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      token != null && token != "" && isFirstTimeinstall != ""
          ? Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            )
          : isFirstTimeinstall != ""
              ? Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterScreen()),
                )
              : Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OnboardingScreen()),
                );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 200,
                ),
                Container(
                  width: 180,
                  height: 150,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/logo.png'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                const Spacer(),
                Text(
                  'iDemocracy',
                  style:
                      AppFonts.semiBoldText(context, 16, AppColors.mainColor),
                ),
              ],
            ),
          ),
        ));
  }
}
