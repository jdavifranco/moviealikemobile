import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

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
    @Deprecated('Unused parameter. Use `YoutubePlayerParam.userAgent` instead.') this.userAgent,
  });

  final Widget Function(BuildContext context, Widget player) builder;

  final YoutubePlayerController controller;

  final double aspectRatio;

  final bool enableFullScreenOnVerticalDrag;

  final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers;

  final Color? backgroundColor;

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
    _progressStream = widget.controller.videoStateStream.map((event) => event.position);
    _controllerSubscription = widget.controller.listen(_setUpProgressListener);
  }

  void _setUpProgressListener(YoutubePlayerValue value) {
    final duration = value.metaData.duration;
    if (_onePercentFromVideo == null && duration > Duration.zero && widget.isVideoLesson) {
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
      if (_videoProgress.last >= _percentProgressToLogEvent && !_isLoggedEvent) {
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
