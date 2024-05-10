import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:voting/generated/l10n.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/candidates_list_widget.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/personal_information_in_cnadidate_profile.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/video_in_candidate_profile.dart';

class CandidateProfileContent extends StatelessWidget {
  const CandidateProfileContent(
      {super.key,
      required this.controller,
      required this.initializeVideoPlayerFuture});
  final VideoPlayerController controller;
  final Future<void> initializeVideoPlayerFuture;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VideoInCandidateProfile(
          initializeVideoPlayerFuture: initializeVideoPlayerFuture,
          controller: controller,
        ),
        const SizedBox(
          height: 16,
        ),
        const PersonalInfoInCandidateProfile(),
        const SizedBox(
          height: 16,
        ),
        BioAndGoals(
            title: S.of(context).bio_titel, desc: S.of(context).bio_desc),
        const SizedBox(
          height: 16,
        ),
        BioAndGoals(
            title: S.of(context).goal_titel, desc: S.of(context).goal_desc)
      ],
    );
  }
}
