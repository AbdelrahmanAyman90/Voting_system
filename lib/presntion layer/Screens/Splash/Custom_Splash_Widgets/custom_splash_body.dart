import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';

class CustomSplashBody extends StatelessWidget {
  const CustomSplashBody({super.key, required this.img1, required this.img2});
  final AnimationController img1;
  final AnimationController img2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Stack(
        children: [
          Positioned(
            left: MediaQuery.of(context).size.width * 0.2,
            child: SlideTransition(
              position: Tween<Offset>(
                      begin: const Offset(4, 0), end: const Offset(0, 0))
                  .animate(img1),
              child: Image.asset('assets/images/Mask group (1).png',
                  //height: MediaQuery.of(context).size.height * .8,
                  width: MediaQuery.of(context).size.width * .2),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.26,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(4, 0),
                end: const Offset(0, 0),
              ).animate(img2),
              child: SizedBox(
                height: 55,
                child: Image.asset('assets/images/Mask group.png',
                    //height: MediaQuery.of(context).size.height * .085,
                    width: MediaQuery.of(context).size.width * .58),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
