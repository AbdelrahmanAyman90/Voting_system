import 'package:flutter/material.dart';
import 'package:voting/presntion%20layer/Screens/Onboarding/fourth_screen.dart';
import 'package:voting/presntion%20layer/Screens/Onboarding/thrird_screen.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/Fonts.dart';
import 'package:voting/presntion%20layer/Screens/Onboarding/Custom_Onboarding/Onboarding_Page.dart';

class OnboardingScreen2 extends StatefulWidget {
  const OnboardingScreen2({super.key});

  @override
  State<OnboardingScreen2> createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFFCAD4C3), Color(0xFFFFEBD8)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.4,
                    0.6,
                  ])),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              const onboarding_page(
                  img: 'assets/images/Group 651.png',
                  tittle: '100% safe and secure ',
                  tittle2: 'voteing',
                  desc:
                      'Since our app is built on blockchain,it is very secure,Results and votes can’t be manipulated by a third party.'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
//////////////////////////  DOTS //////////////////////////////////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.height * 0.015,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.height * 0.015,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.mainColor),
                    ),
                  ),
                  for (int i = 0; i < 2; i++)
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
                            const OnboardingScreen3(),
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
          )),
    );
  }
}
