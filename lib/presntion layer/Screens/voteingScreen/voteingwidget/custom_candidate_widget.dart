import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';
import 'package:voting/generated/l10n.dart';

class ShowCandidate extends StatelessWidget {
  final bool isSelected; // Property to indicate selection status

  const ShowCandidate({Key? key, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("bbbb");
    return Container(
      // height: 110,
      // width: 360,
      decoration: BoxDecoration(
        color: AppColors.whitebackgroundcolor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected
              ? const Color.fromRGBO(0, 135, 83, 1)
              : Colors.transparent,
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    //todo api
                    S.of(context).candidate_name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: isEnglish() ? 8 : 0),
                  Text(
                    S.of(context).candidate_bio,
                    style: TextStyle(
                        color: AppColors.secondaryTextColor, fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
