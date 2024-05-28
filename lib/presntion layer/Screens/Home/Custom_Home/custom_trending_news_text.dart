import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/generated/l10n.dart';

class CustomTrendingNewsText extends StatelessWidget {
  const CustomTrendingNewsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(S.of(context).trending_news,
            style: AppFonts.regularText(
              context,
              18,
              AppColors.secondaryTextColor,
            )),

        const SizedBox(
          width: 5,
        ),
        Icon(
          Icons.campaign_outlined,
          color: AppColors.secondaryTextColor,
        ),
        // const Image(
        //     image: AssetImage('assets/images/Group 720.png')),
      ],
    );
  }
}
