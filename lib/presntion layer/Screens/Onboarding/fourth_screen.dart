import 'package:flutter/material.dart';
import 'package:voting/presntion%20layer/Screens/Home/Home_Screen.dart';
import 'package:voting/presntion%20layer/Screens/Home/Home_page_of_nomination/Home1.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/Fonts.dart';
import 'package:voting/presntion%20layer/Screens/Onboarding/Custom_Onboarding/Onboarding_Page.dart';

class OnboardingScreen4 extends StatelessWidget {
  const OnboardingScreen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xFFE3FDF3), Color(0xFFE7F9EE)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              const onboarding_page(
                  img: 'assets/images/Group.png',
                  img2: 'assets/images/Text_1_.png',
                  tittle: 'Your Identity will remain',
                  tittle2: 'anonymous',
                  desc:
                      'Full transparency is made possible by the blockchain technology. Any participant in the system has the ability to verify each vote.'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
//////////////////////////////  DOTS /////////////////////////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 3; i++)
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
                        builder: (BuildContext context) => Home_Screen(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.mainColor),
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
                    'Let’s Get Started',
                    style:
                        AppFonts.regularText(fontSize: 16, color: Colors.white),
                  )),
            ],
          )),
    );
  }
}
