import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/Shared/const/const_varible.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';
import 'package:voting/Shared/shareWidget/global_widget.dart';
import 'package:voting/generated/l10n.dart';

class CustomResultCandidate extends StatelessWidget {
  const CustomResultCandidate({
    super.key,
    required this.color,
    required this.standing,
    required this.count,
    required this.image,
    required this.name,
  });

  final bool color;
  final int standing;
  final String name;
  final int count;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whitebackgroundcolor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color ? AppColors.mainColor : Colors.transparent,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        child: Row(
          children: [
            imageContainer(imagePath + image),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppFonts.semiBoldText(context, 16, Colors.black),
                  ),
                  const SizedBox(height: 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildVoteCount(context),
                        _buildStanding(context),
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
  /**
   * 
   * widget fun
   */

  Widget _buildVoteCount(BuildContext context) {
    return Row(
      children: [
        Text(
          '${S.of(context).votes_word}: ',
          style:
              AppFonts.regularText(context, 14, AppColors.secondaryTextColor),
        ),
        Text(
          isEnglish()
              ? '$count'
              : convertEnglishNumberToArabicNumber(count.toString()),
          style: AppFonts.semiBoldText(context, 14, AppColors.mainColor),
        ),
      ],
    );
  }

  Widget _buildStanding(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 28,
      child: Stack(
        children: [
          Positioned(
            bottom: 10,
            left: 9,
            child: Row(
              children: [
                Text(
                  "$standing",
                  style: AppFonts.boldText(context, 16, AppColors.mainColor),
                ),
                const SizedBox(width: 2),
                Text(
                  "rd",
                  style: AppFonts.boldText(context, 16, AppColors.mainColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
