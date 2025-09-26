import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviealike/presentation/common/extensions/build_context.dart';
import 'package:moviealike/presentation/common/style/app_colors.dart';
import 'package:moviealike/presentation/screens/movie_details/widgets/youtube_player_builder.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class CustomYoutubeVideoFrame extends StatefulWidget {
  final YoutubePlayerController? youtubePlayerController;

  final bool isVideoLesson;
  final bool isPausedByNavigation;
  final Widget Function(BuildContext context,
      YoutubePlayerController controller, bool isVideoLesson) youtubeBuilder;

  const CustomYoutubeVideoFrame({
    super.key,
    required this.youtubePlayerController,
    this.youtubeBuilder = _defaultYoutubeBuilder,
    this.isVideoLesson = false,
    this.isPausedByNavigation = false,
  });

  static Widget _defaultYoutubeBuilder(BuildContext context,
          YoutubePlayerController controller, bool isVideoLesson) =>
      YoutubePlayerBuilder(
        backgroundColor: AppColors.secondary,
        controller: controller,
        builder: (context, player) => player,
        isVideoLesson: isVideoLesson,
      );

  @override
  State<CustomYoutubeVideoFrame> createState() =>
      _CustomYoutubeVideoFrameState();
}

class _CustomYoutubeVideoFrameState extends State<CustomYoutubeVideoFrame>
    with OnContextReady {
  List<DeviceOrientation>? defaultOrientations;

  @override
  void onContextReady(BuildContext context) {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final controller = widget.youtubePlayerController;
    final height = orientation == Orientation.landscape
        ? MediaQuery.sizeOf(context).height * 0.5
        : null;

    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      child: Container(
        color: AppColors.secondary,
        child: controller != null
            ? Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: height,
                    child: widget.youtubeBuilder(
                        context, controller, widget.isVideoLesson),
                  ),
                ],
              )
            : SizedBox(
                width: MediaQuery.sizeOf(context).width,
              ),
      ),
    );
  }
}
