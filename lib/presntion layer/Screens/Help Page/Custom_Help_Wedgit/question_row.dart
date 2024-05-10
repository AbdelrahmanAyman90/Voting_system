import 'package:flutter/material.dart';
import 'package:voting/Shared/Colors.dart';
import 'package:voting/Shared/Fonts.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';

class QuestionRow extends StatelessWidget {
  final String ques;
  const QuestionRow({
    super.key,
    required this.ques,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isEnglish() ? Icons.play_arrow_rounded : Icons.arrow_right_rounded,
          size: isEnglish() ? null : 50,
          color: AppColors.mainColor,
        ),
        SizedBox(
          width: isEnglish() ? 5 : 0,
        ),
        Text(
          ques,
          style: AppFonts.semiBoldText(context, 14, Colors.black),
        ),
      ],
    );
  }
}
