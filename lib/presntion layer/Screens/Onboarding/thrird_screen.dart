import 'package:flutter/material.dart';
import 'package:voting/presntion%20layer/Screens/Onboarding/fourth_screen.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/Fonts.dart';
import 'package:voting/presntion%20layer/Screens/Onboarding/Custom_Onboarding/Onboarding_Page.dart';

class OnboardingScreen3 extends StatefulWidget {
  const OnboardingScreen3({super.key});

  @override
  State<OnboardingScreen3> createState() => _OnboardingScreen3State();
}

class _OnboardingScreen3State extends State<OnboardingScreen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFFE0FFE3), Color(0xFF9EDEBE)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.2,
                    0.6,
                  ])),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              const onboarding_page(
                  img: 'assets/images/Group 636.png',
                  tittle: 'Results are Completely open,',
                  tittle2: 'clear and verifiable',
                  desc:
                      'Full transparency is made possible by the blockchain technology. Any participant in the system has the ability to verify each vote.'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
/////////////////////////////// DOTS   /////////////////////////////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  SizedBox(
                    width: MediaQuery.of(context).size.height * 0.015,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.mainColor),
                    ),
                  ),
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
                            const OnboardingScreen4(),
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
