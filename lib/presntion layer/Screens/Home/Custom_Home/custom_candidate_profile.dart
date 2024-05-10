import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:voting/presntion%20layer/Screens/Home/Custom_Home/candidate_profile_page_content.dart';

class CustomCandidatesProfile extends StatelessWidget {
  const CustomCandidatesProfile(
      {super.key,
      required this.controller,
      required this.initializeVideoPlayerFuture});

  final VideoPlayerController controller;
  final Future<void> initializeVideoPlayerFuture;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: CandidateProfileContent(
              controller: controller,
              initializeVideoPlayerFuture: initializeVideoPlayerFuture)),
    );
  }
}
