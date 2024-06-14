import 'package:flutter/material.dart';

import 'package:voting/Shared/const/const_vrible.dart';
import 'package:voting/Shared/shard%20local/function_helper.dart';
import 'package:voting/Shared/const/Colors.dart';
import 'package:voting/Shared/const/Fonts.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/custom_candidate_profile.dart';

class Candidates extends StatefulWidget {
  const Candidates(
      {super.key, required this.candidateId, required this.candidateName});
  final String candidateId;
  final String candidateName;
  @override
  State<Candidates> createState() => _CandidatesState();
}

class _CandidatesState extends State<Candidates> {
  // late VideoPlayerController _controller;
  // late Future<void> _initializeVideoPlayerFuture;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.mainColor,
            size: 20,
          ),
        ),
        title: Text(
          widget.candidateName,
          style: AppFonts.boldText(context, 16, AppColors.mainColor),
        ),
        centerTitle: true,
      ),
      body: CustomCandidatesProfile(
        isRealCandidate: widget.candidateId == idUser ? true : false,
        isAddCampiagn: isAddCampiagnValue,
      ),
    );
  }
}
