import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voting/presntion%20layer/Screens/confirmVotingScreen/confirmVotingWidget/body_confirm_voting.dart';
import 'package:voting/presntion%20layer/view_model/get_candidate_viewmodel/cubit/get_candidate_cubit.dart';

class ConfirmVoteScreen extends StatelessWidget {
  const ConfirmVoteScreen({Key? key, required this.selectIndex})
      : super(key: key);
  final int selectIndex;
  @override
  Widget build(BuildContext context) {
    log("====");
    log(selectIndex.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.only(top: 15, left: 10),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_sharp,
              size: 18,
              color: Color(0xFF008753),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: ConfirmVotingBody(
          candataeDataSelected:
              context.read<GetCandidateCubit>().allCandidateList[selectIndex],
        ),
      ),
    );
  }
}
