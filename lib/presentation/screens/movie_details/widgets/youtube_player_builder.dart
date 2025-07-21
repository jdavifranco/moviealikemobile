// coverage:ignore-file
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

/// A widget the scaffolds the [YoutubePlayer] so that it can be moved around easily in the view
/// and handles the fullscreen functionality.
class YoutubePlayerBuilder extends StatefulWidget {
  const YoutubePlayerBuilder({
    super.key,
    required this.builder,
    required this.controller,
    this.aspectRatio = 16 / 9,
    this.gestureRecognizers = const <Factory<OneSequenceGestureRecognizer>>{},
    this.enableFullScreenOnVerticalDrag = false,
    this.backgroundColor,
    this.isVideoLesson = false,
    @Deprecated('Unused parameter. Use `YoutubePlayerParam.userAgent` instead.')
    this.userAgent,
  });

  /// Builds the child widget.
  final Widget Function(BuildContext context, Widget player) builder;

  /// The player controller.
  final YoutubePlayerController controller;

  /// The aspect ratio of the player.
  ///
  /// The value is ignored on fullscreen mode.
  final double aspectRatio;

  /// Enables switching full screen mode on vertical drag in the player.
  ///
  /// Default is true.
  final bool enableFullScreenOnVerticalDrag;

  /// Which gestures should be consumed by the youtube player.
  ///
  /// This property is ignored in web.
  final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers;

  /// The background color of the WebView.
  final Color? backgroundColor;

  /// The value used for the HTTP User-Agent: request header.
  ///
  /// When null the platform's webview default is used for the User-Agent header.
  ///
  /// By default `userAgent` is null.
  final String? userAgent;

  final bool isVideoLesson;
  @override
  State<YoutubePlayerBuilder> createState() => _YoutubePlayerBuilderState();
}

class _YoutubePlayerBuilderState extends State<YoutubePlayerBuilder> {
  late final GlobalObjectKey _playerKey;
  Stream<Duration>? _progressStream;
  StreamSubscription? _progressSubscription;
  StreamSubscription? _controllerSubscription;
  final _percentProgressToLogEvent = 20;
  Duration? _videoDuration;
  Duration? _onePercentFromVideo;
  final Set<int> _videoProgress = {};
  bool _isLoggedEvent = false;

  @override
  void initState() {
    super.initState();
    _playerKey = GlobalObjectKey(widget.controller);
    _progressStream =
        widget.controller.videoStateStream.map((event) => event.position);
    _controllerSubscription = widget.controller.listen(_setUpProgressListener);
  }

  void _setUpProgressListener(YoutubePlayerValue value) {
    final duration = value.metaData.duration;
    if (_onePercentFromVideo == null &&
        duration > Duration.zero &&
        widget.isVideoLesson) {
      _videoDuration ??= duration;
      _onePercentFromVideo ??= Duration(seconds: duration.inSeconds ~/ 100);
      _progressSubscription = _progressStream!.listen(_startListenProgress);
    }
  }

  void _startListenProgress(Duration event) {
    final progress = event.inSeconds ~/ _onePercentFromVideo!.inSeconds;
    _controllerSubscription?.cancel();
    if (!_videoProgress.contains(progress)) {
      _videoProgress.add(progress);
      if (_videoProgress.last >= _percentProgressToLogEvent &&
          !_isLoggedEvent) {
        _isLoggedEvent = true;

        _progressSubscription?.cancel();
      }
    }
  }

  @override
  void dispose() {
    _controllerSubscription?.cancel();
    _progressSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final player = KeyedSubtree(
      key: _playerKey,
      child: YoutubePlayer(
        controller: widget.controller,
        aspectRatio: widget.aspectRatio,
        gestureRecognizers: widget.gestureRecognizers,
        enableFullScreenOnVerticalDrag: widget.enableFullScreenOnVerticalDrag,
        backgroundColor: widget.backgroundColor,
      ),
    );

    return YoutubePlayerControllerProvider(
      controller: widget.controller,
      child: kIsWeb
          ? widget.builder(context, player)
          : YoutubeValueBuilder(
              controller: widget.controller,
              buildWhen: (o, n) => o.fullScreenOption != n.fullScreenOption,
              builder: (context, value) {
                return Builder(
                  builder: (context) {
                    if (value.fullScreenOption.enabled) {
                      return player;
                    }

                    return widget.builder(context, player);
                  },
                );
              },
            ),
    );
  }
}
