import 'package:flutter/material.dart';
import 'package:moviealike/domain/recommendations/models/movie_recommendation.dart';
import 'package:moviealike/presentation/common/extensions/build_context.dart';
import 'package:moviealike/presentation/common/remote_image/remote_image.dart';
import 'package:moviealike/presentation/common/style/app_colors.dart';
import 'package:moviealike/presentation/widgets/gradient_box_border.dart';

class MovieDetailDialog extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String genre;
  final String runtime;
  final String overview;
  final double distance;
  final int id;
  final double rating;
  final VoidCallback onSeeMore;
  final MovieRecommendation movie;
  const MovieDetailDialog({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.genre,
    required this.runtime,
    required this.overview,
    required this.distance,
    required this.id,
    required this.onSeeMore,
    required this.rating,
    required this.movie,
  }) : super(key: key);

  @override
  State<MovieDetailDialog> createState() => _MovieDetailDialogState();
}

class _MovieDetailDialogState extends State<MovieDetailDialog> {
  late double maxWidth = MediaQuery.sizeOf(context).width / 2;
  final double maxHeight = 700;
  final double padding = 20;
  final Color highlyRecommendedColor =
      const Color(0xFF22B07D); // Vibrant Magenta (Your Accent)
  final Color similarColor = const Color(0xFFFF8700); // Vivid Orange-Red
  final Color relatedColor = const Color(0xFFFF7256); // Darker Orange
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.secondary,
      insetPadding: EdgeInsets.all(padding),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: GradientBoxBorder(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    getRecommendedColor(widget.distance).withOpacity(0.3),
                    getRecommendedColor(widget.distance).withOpacity(0.3),
                    getRecommendedColor(widget.distance).withOpacity(0.5),
                    getRecommendedColor(widget.distance).withOpacity(0.8),
                  ],
                  stops: [
                    0.0,
                    0.5,
                    0.8,
                    1
                  ]),
            ),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  getRecommendedColor(widget.distance)
                      .withOpacity(widget.distance * 0.3),
                  getRecommendedColor(widget.distance)
                      .withOpacity(widget.distance * 0.5),
                  getRecommendedColor(widget.distance)
                      .withOpacity(widget.distance * 0.8),
                  getRecommendedColor(widget.distance)
                      .withOpacity(widget.distance),
                ],
                stops: [
                  0.0,
                  0.5,
                  0.8,
                  1
                ]),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Hero(
                  tag: 'movie-poster-${widget.title}',
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: RemoteImage(
                        imageUrl: widget.imageUrl,

                        width: maxWidth, // Reduced image width
                        height: 300, // Reduced image height
                        fit: BoxFit.cover,
                        imageBuilder: (context, imageProvider) => Container(
                          width: maxWidth,
                          height: 300,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                          ),
                        ),

                        errorWidget: (context, url, error) => Container(
                          width: maxWidth,
                          height: 300,
                          decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.error,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15), // Reduced SizedBox height
                Text(
                  widget.title,
                  style: context.typography.heading4.copyWith(
                      color: AppColors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4), // Reduced SizedBox height
                Text(
                  widget.movie.genres?.join(", ") ?? "",
                  style: context.typography.heading6.copyWith(
                      color: AppColors.white.withOpacity(0.8),
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 12), // Reduced SizedBox height
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.star,
                              color: Colors.orange, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            widget.rating.toString(),
                            style: context.typography.heading6.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12), // Reduced spacing
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.compare,
                              color: Colors.orange, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            '${(widget.distance * 100).toStringAsFixed(0)}% similar',
                            style: context.typography.heading6.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16), // Reduced SizedBox height
                Text(
                  context.text.overview,
                  style: context.typography.heading5.copyWith(
                      color: AppColors.white, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4), // Reduced SizedBox height
                Text(
                  widget.overview,
                  maxLines: 3, // Further limited overview lines
                  overflow: TextOverflow.ellipsis,
                  style: context.typography.heading6
                      .copyWith(color: AppColors.white.withOpacity(0.8)),
                ),
                const SizedBox(height: 16), // Reduced SizedBox height
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(context.text.close,
                          style: TextStyle(color: AppColors.white)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Navigate to movie details page or perform action
                        print("See More button pressed for ${widget.title}");
                        Navigator.of(context).pop();
                        widget.onSeeMore();
                      },
                      style: ElevatedButton.styleFrom(
                        surfaceTintColor: AppColors.accent,
                      ),
                      child: Text(context.text.seeMore,
                          style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color getRecommendedColor(double distance) {
    if (distance > 0.7) {
      return highlyRecommendedColor;
    } else if (distance > 0.5) {
      return similarColor;
    } else {
      return relatedColor;
    }
  }
}
