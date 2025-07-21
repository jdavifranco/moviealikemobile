import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class CustomYoutubePlayer extends StatefulWidget {
  final String youtubeId;
  final VoidCallback onReady;
  const CustomYoutubePlayer(
      {super.key, required this.youtubeId, required this.onReady});

  @override
  State<CustomYoutubePlayer> createState() => _CustomYoutubePlayerState();
}

class _CustomYoutubePlayerState extends State<CustomYoutubePlayer> {
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    _youtubeController = YoutubePlayerController.fromVideoId(
      videoId: widget.youtubeId,
      params: const YoutubePlayerParams(
        showControls: false,
        showFullscreenButton: true,
      ),
    );

    _youtubeController.listen((data) {
      if (data.playerState == PlayerState.cued) {
        widget.onReady();
        _youtubeController.playVideo();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _youtubeController,
    );
  }

  @override
  void dispose() {
    _youtubeController.close(); // Dispose of the YouTube player controller
    super.dispose();
  }
}
