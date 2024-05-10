import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Home/Home_Screen.dart';

import 'package:voting/Shared/shareWidget/button.dart';

class ThankesToVoteScreen extends StatelessWidget {
  const ThankesToVoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            const SizedBox(
              height: 170,
            ),
            SvgPicture.asset(
              'assets/images/Group 575.svg',
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              S.of(context).thankes_vote,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              S.of(context).sub_title_thankes_vote_1,
              style: TextStyle(
                  color: AppColors.secondaryTextColor,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              S.of(context).sub_title_thankes_vote_2,
              style: TextStyle(
                  color: AppColors.secondaryTextColor,
                  // color: Color.fromRGBO(119, 114, 114, 1),
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 200,
            ),
            ButtonWidget(
              onPressed: () {
                //todo
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Home_Screen()),
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
    );
  }
}
