import 'package:flutter/material.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/resultScreen/resultwidget/custom_result_candidate_widget.dart';

class TotalVoteSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //total voting
        Text(
          S.of(context).total_vote,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.secondaryTextColor,
          ),
        ),
        //voting end
        Text(
          // todo api
          S.of(context).voting_end,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: AppColors.secondaryTextColor,
          ),
        ),
      ],
    );
  }
}

class AllVoterNumberSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //all voter
        Text(
          // todo api
          S.of(context).all_voter_number,
          style: TextStyle(
            color: AppColors.mainColor,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 18),
      ],
    );
  }
}

class CandidateListSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return index == 0
              ? CustomResultCndidate(
                  color: true,
                  standing: index + 1,
                )
              : CustomResultCndidate(
                  color: false,
                  standing: index + 1,
                );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 18),
        itemCount: 9,
      ),
    );
  }
}

class RusltBody extends StatelessWidget {
  const RusltBody({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondbackgroundcolor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TotalVoteSection(),
            const SizedBox(height: 18),
            AllVoterNumberSection(),
            CandidateListSection(),
          ],
        ),
      ),
    );
  }
}
