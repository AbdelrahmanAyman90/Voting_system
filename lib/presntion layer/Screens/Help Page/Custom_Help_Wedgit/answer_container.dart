import 'package:flutter/material.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';

class AnswerContainer extends StatelessWidget {
  final String answer;
  const AnswerContainer({
    super.key,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.profilebackgroundcolor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          answer,
          style: AppFonts.regularText(context, 14, Colors.black),
        ),
      ),
    );
  }
}
