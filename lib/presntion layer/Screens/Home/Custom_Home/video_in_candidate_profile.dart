import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoInCandidateProfile extends StatefulWidget {
  const VideoInCandidateProfile(
      {super.key,
      required this.controller,
      required this.initializeVideoPlayerFuture});

  final VideoPlayerController controller;
  final Future<void> initializeVideoPlayerFuture;

  @override
  State<VideoInCandidateProfile> createState() =>
      _VideoInCandidateProfileState();
}

class _VideoInCandidateProfileState extends State<VideoInCandidateProfile> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      FutureBuilder(
        future: widget.initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: AspectRatio(
                aspectRatio: widget.controller.value.aspectRatio,
                child: VideoPlayer(widget.controller),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      Positioned(
        left: MediaQuery.sizeOf(context).width * 0.40,
        top: MediaQuery.sizeOf(context).height * 0.09,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(50)),
          child: FloatingActionButton(
            backgroundColor: const Color.fromARGB(0, 255, 255, 255),
            elevation: 0,
            onPressed: () {
              setState(() {
                if (widget.controller.value.isPlaying) {
                  widget.controller.pause();
                } else {
                  widget.controller.play();
                }
              });
            },
            child: Icon(
              widget.controller.value.isPlaying
                  ? Icons.pause
                  : Icons.play_arrow,
            ),
          ),
        ),
      )
    ]);
  }
}
