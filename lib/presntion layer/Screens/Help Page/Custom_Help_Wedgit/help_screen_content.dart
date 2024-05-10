import 'package:flutter/material.dart';
import 'package:voting/presntion%20layer/Screens/Help%20Page/Custom_Help_Wedgit/question_and_answer_container.dart';

class HelpScreenContent extends StatelessWidget {
  const HelpScreenContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        for (int i = 0; i <= 10; i++) const QuestionAndAnswerContainer()
      ],
    );
  }
}
