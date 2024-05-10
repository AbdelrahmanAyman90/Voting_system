import 'package:flutter/material.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/generated/l10n.dart';

class CustomResultCndidate extends StatelessWidget {
  const CustomResultCndidate(
      {super.key, required this.color, required this.standing});
  final bool color;
  final int standing;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 360,
      decoration: BoxDecoration(
        color: AppColors.whitebackgroundcolor,
        // color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color ? AppColors.bordercolorgreen : Colors.transparent,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          children: [
            Image.asset(
              "assets/images/Mask group candidate.png",
              width: 94,
              height: 94,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // todo api
                      S.of(context).candidate_name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                                style: TextStyle(
                                    color: AppColors.secondaryTextColor,
                                    // color: Color.fromARGB(255, 95, 93, 93),
                                    fontSize: 16),
                              ),
                              Text(
                                // todo api
                                S.of(context).candiadate_number_voter,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 14),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 28,
                            height: 28,
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 10,
                                  left: 9,
                                  child: Text(
                                    "rd",
                                    style: TextStyle(
                                        color: AppColors.mainColor,
                                        // color: Color.fromRGBO(0, 135, 83, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  "${standing}",
                                  style: TextStyle(
                                      color: AppColors.mainColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
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
            ),
          ],
        ),
      ),
    );
  }
}
