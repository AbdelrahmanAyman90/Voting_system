import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/generated/l10n.dart';

class CustomResultCndidate extends StatelessWidget {
  const CustomResultCndidate(
      {super.key, required this.color, required this.standing});
  final bool color;
  final int standing;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 110,
      // width: 360,
      decoration: BoxDecoration(
        color: AppColors.whitebackgroundcolor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color ? AppColors.mainColor : Colors.transparent,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          children: [
            Image.asset(
              "assets/images/Mask group candidate.png",
              // width: 94,
              // height: 94,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // todo api
                    S.of(context).candidate_name,
                    style: AppFonts.semiBoldText(context, 16, Colors.black),
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${S.of(context).votes_word} :',
                              style: AppFonts.regularText(
                                  context, 14, AppColors.secondaryTextColor),
                            ),
                            Text(
                                // todo api
                                S.of(context).candiadate_number_voter,
                                style: AppFonts.semiBoldText(
                                    context, 14, AppColors.mainColor))
                          ],
                        ),
                        SizedBox(
                          width: 40,
                          height: 28,
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 10,
                                left: 9,
                                child: Row(
                                  children: [
                                    Text("$standing",
                                        style: AppFonts.boldText(
                                            context, 16, AppColors.mainColor)),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Text("rd",
                                        style: AppFonts.boldText(
                                            context, 16, AppColors.mainColor)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
