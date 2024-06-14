import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:voting/Shared/const/const_vrible.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key, required this.pathViedio});
  final String pathViedio;
  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse(imagePath + widget.pathViedio),
      ),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: FlickVideoPlayer(
          flickManager: flickManager,
        ),
      ),
    );
  }
}
