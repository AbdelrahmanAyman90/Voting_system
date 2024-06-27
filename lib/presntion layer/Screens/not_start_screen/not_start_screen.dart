import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/custom_candidate_page_in_nomination_period.dart';

class NotStart extends StatelessWidget {
  const NotStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/Group 543.svg',
            ),
            const SizedBox(
              height: 30,
            ),
            //!الانتخبات لم تبدا بعد
            const CustomCandidatesPageInNomination(),
          ],
        ),
      ),
    );
  }
}
