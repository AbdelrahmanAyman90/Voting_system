import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/generated/l10n.dart';

class CustomCandidatesPageInNomination extends StatelessWidget {
  const CustomCandidatesPageInNomination({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).no_election,
          style: AppFonts.semiBoldText(context, 16, Colors.black),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 80),
          //width: 200,
          //height: MediaQuery.of(context).size.height * 40 / 812,
          child: Center(
            child: Text(
              S.of(context).election_start,
              textAlign: TextAlign.center,
              style: AppFonts.regularText(
                context,
                12,
                AppColors.secondaryTextColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
