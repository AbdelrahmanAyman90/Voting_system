import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/Fonts.dart';
import 'package:voting/generated/l10n.dart';

class VotingBodyNomination extends StatefulWidget {
  const VotingBodyNomination({super.key});

  @override
  State<VotingBodyNomination> createState() => _VotingBodyNominationState();
}

class _VotingBodyNominationState extends State<VotingBodyNomination> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/Group 542.svg'),
          const SizedBox(height: 30),
          Text(
            S.of(context).no_election,
            style: AppFonts.semiBoldText(context, 16, Colors.black),
          ),
          const SizedBox(height: 12),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 70),
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
      ),
    );
  }
}
