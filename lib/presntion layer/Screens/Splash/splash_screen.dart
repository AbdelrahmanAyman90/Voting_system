import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:voting/presntion%20layer/Screens/Onboarding/first_screen.dart';
import 'package:voting/Shared/Colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _img1;
  late AnimationController _img2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _img1 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    _img1.forward();
    _img2 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    _img2.forward();
  }

  @override
  void dispose() {
    _img1.dispose();
    _img2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 50 / 812,
          child: Stack(
            children: [
              Positioned(
                left: MediaQuery.of(context).size.width * 1 / 4,
                child: SlideTransition(
                  position: Tween<Offset>(
                          begin: const Offset(4, 0), end: const Offset(0, 0))
                      .animate(_img1),
                  child: Image.asset('assets/images/Mask group (1).png',
                      //height: MediaQuery.of(context).size.height * .8,
                      width: MediaQuery.of(context).size.width * .2),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.32,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(4, 0),
                    end: const Offset(0, 0),
                  ).animate(_img2),
                  child: Image.asset('assets/images/Mask group.png',
                      height: MediaQuery.of(context).size.height * .072,
                      width: MediaQuery.of(context).size.width * .5),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.mainColor,
      nextScreen: const OnboardingScreen1(),
      duration: 3000,
      animationDuration: const Duration(seconds: 1),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
