// coverage:ignore-file
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviealike/presentation/common/remote_image/remote_image_cache_manager.dart';

class RemoteImage extends StatelessWidget {
  final String? imageUrl;
  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;
  final Widget? placeholder;
  final Widget Function(BuildContext, String, DownloadProgress)?
      progressIndicatorBuilder;
  final Widget Function(BuildContext, String, dynamic)? errorWidget;
  final EdgeInsetsGeometry padding;
  final Duration? fadeOutDuration;
  final Curve fadeOutCurve;
  final Duration fadeInDuration;
  final Curve fadeInCurve;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  const RemoteImage({
    super.key,
    required this.imageUrl,
    this.imageBuilder,
    this.placeholder,
    this.progressIndicatorBuilder,
    this.padding = EdgeInsets.zero,
    this.fadeOutDuration = Duration.zero,
    this.fadeOutCurve = Curves.easeInOut,
    this.fadeInDuration = Duration.zero,
    this.fadeInCurve = Curves.easeInOut,
    this.errorWidget,
    this.width,
    this.height,
    this.fit,
    this.color,
  }) : assert(placeholder == null || progressIndicatorBuilder == null,
            "Should use a placeholder or a progressIndicatorBuilder");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: CachedNetworkImage(
        height: height,
        width: width,
        imageUrl: imageUrl ?? "",
        imageBuilder: imageBuilder,
        cacheManager: RemoteImageCacheManager.maybeOf(context)?.cacheManager,
        placeholder:
            placeholder != null ? (context, string) => placeholder! : null,
        progressIndicatorBuilder: progressIndicatorBuilder,
        errorWidget: errorWidget ??
            (placeholder != null
                ? (context, url, error) => placeholder!
                : null),
        fadeOutDuration: fadeOutDuration,
        fadeOutCurve: fadeOutCurve,
        fadeInDuration: fadeInDuration,
        fadeInCurve: fadeInCurve,
        fit: fit ?? BoxFit.cover,
      ),
    );
  }
}
