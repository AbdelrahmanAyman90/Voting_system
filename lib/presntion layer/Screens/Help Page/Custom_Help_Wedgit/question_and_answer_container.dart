import 'package:flutter/material.dart';
import 'package:voting/data/models/qustion_model/qustion_model.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Help%20Page/Custom_Help_Wedgit/answer_container.dart';
import 'package:voting/presntion%20layer/Screens/Help%20Page/Custom_Help_Wedgit/question_row.dart';

class QuestionAndAnswerContainer extends StatelessWidget {
  const QuestionAndAnswerContainer({required this.qustionData});
  final QustionModel qustionData;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          QuestionRow(ques: qustionData.question!),
          const SizedBox(
            height: 10,
          ),
          AnswerContainer(answer: qustionData.answer!),
        ],
      ),
    );
  }
}
