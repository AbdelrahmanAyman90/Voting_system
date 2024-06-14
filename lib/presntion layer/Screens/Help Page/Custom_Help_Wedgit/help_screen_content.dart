import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/presntion%20layer/Screens/Help%20Page/Custom_Help_Wedgit/question_and_answer_container.dart';
import 'package:voting/presntion%20layer/view_model/qustion_viewmodel/cubit/qustion_cubit.dart';

class HelpScreenContent extends StatelessWidget {
  const HelpScreenContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<QustionCubit>(context);
    cubit.fetchQustion(); //! call function to fitch qustion
    log("هنا");
    log(cubit.qustionList.length.toString());
    return BlocBuilder<QustionCubit, QustionState>(
      builder: (context, state) {
        if (state is QustionSuccess) {
          return Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              for (int i = 0; i < cubit.qustionList.length; i++)
                QuestionAndAnswerContainer(qustionData: cubit.qustionList[i])
            ],
          );
        } else if (state is QustionFail) {
          return Center(
              child: Text(
            state.errorMassage,
            style: TextStyle(fontSize: 22),
          ));
        } else {
          return Center(
              child: CircularProgressIndicator(
            color: AppColors.mainColor,
          ));
        }
      },
    );
  }
}
