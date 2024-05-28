import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/resultScreen/resultwidget/custom_result_candidate_widget.dart';

class RusltBody extends StatelessWidget {
  const RusltBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondbackgroundcolor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //total voting
                Text(S.of(context).total_vote,
                    style: AppFonts.regularText(
                        context, 14, AppColors.secondaryTextColor)),
                //voting end
                Text(
                    // todo api
                    S.of(context).voting_end,
                    style: AppFonts.regularText(
                        context, 14, AppColors.secondaryTextColor)),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            //all voter
            Text(
              // todo api
              S.of(context).all_voter_number,
              style: AppFonts.semiBoldText(
                context,
                16,
                AppColors.mainColor,
              ),
            ),
            const SizedBox(height: 18),
            //list candidate
            Expanded(
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
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemCount: 9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
