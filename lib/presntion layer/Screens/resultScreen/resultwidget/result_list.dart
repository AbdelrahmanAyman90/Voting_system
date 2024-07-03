import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/Shared/const/const_varible.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';
import 'package:voting/data/models/election/election_result.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/resultScreen/resultwidget/custom_result_candidate_widget.dart';

class BodyWhenDataCame extends StatelessWidget {
  const BodyWhenDataCame(
      {super.key,
      required this.results,
      required this.totalCount,
      required this.endRuslt});
  final List<Results> results;
  final int totalCount;
  final bool endRuslt;
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //total voting
                Column(
                  children: [
                    Text(
                      S.of(context).total_vote,
                      style: AppFonts.regularText(
                          context, 14, AppColors.secondaryTextColor),
                    ),
                    Text(
                      // todo api
                      isEnglish()
                          ? '$totalCount'
                          : "${convertEnglishNumberToArabicNumber(totalCount.toString())}",

                      style: AppFonts.semiBoldText(
                        context,
                        16,
                        AppColors.mainColor,
                      ),
                    ),
                  ],
                ),
                //voting end
                endRuslt
                    ? Text(
                        // todo api
                        S.of(context).vot_end,
                        style: AppFonts.regularText(context, 14, Colors.red),
                      )
                    : Text(
                        // todo api
                        "${S.of(context).vote_end_after}${endtimeElection!}",
                        style: AppFonts.regularText(
                            context, 14, AppColors.secondaryTextColor),
                      )
              ],
            ),
            const SizedBox(
              height: 8,
            ),

            const SizedBox(height: 10),
            // todo list candidate
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return index == 0
                      ? CustomResultCandidate(
                          count: results[index].count!,
                          name: results[index].candidate!.name!,
                          image: results[index].candidate!.image!,
                          color: true,
                          standing: index + 1,
                        )
                      : CustomResultCandidate(
                          count: results[index].count!,
                          name: results[index].candidate!.name!,
                          image: results[index].candidate!.image!,
                          color: false,
                          standing: index + 1,
                        );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: results.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
