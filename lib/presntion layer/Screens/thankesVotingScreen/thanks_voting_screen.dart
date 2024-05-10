import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/Fonts.dart';
import 'package:voting/generated/l10n.dart';

import 'package:voting/Shared/shareWidget/button.dart';
import 'package:voting/presntion%20layer/Screens/Home/home_screen.dart';

class ThankesToVoteScreen extends StatelessWidget {
  const ThankesToVoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height < 670 ? 100 : 150,
              ),
              SvgPicture.asset(
                'assets/images/Group 575.svg',
              ),
              const SizedBox(
                height: 60,
              ),
              Text(S.of(context).thankes_vote,
                  style: AppFonts.boldText(context, 20, Colors.black)),
              const SizedBox(
                height: 10,
              ),
              Text(S.of(context).sub_title_thankes_vote_1,
                  style: AppFonts.regularText(
                      context, 16, AppColors.secondaryTextColor)),
              Text(S.of(context).sub_title_thankes_vote_2,
                  style: AppFonts.regularText(
                      context, 16, AppColors.secondaryTextColor)),
              const SizedBox(
                height: 100,
              ),
              ButtonWidget(
                onPressed: () {
                  //todo
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                word: S.of(context).thankes_voting_button,
                color: AppColors.mainColor,
                // color: const Color(0xFF008753),
                textcolor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
