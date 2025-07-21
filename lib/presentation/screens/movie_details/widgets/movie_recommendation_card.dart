import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:moviealike/domain/recommendations/models/movie_recommendation.dart';
import 'package:moviealike/presentation/common/extensions/build_context.dart';
import 'package:moviealike/presentation/common/remote_image/remote_image.dart';
import 'package:moviealike/presentation/common/style/app_colors.dart';
import 'package:moviealike/presentation/constants/app_svgs.dart';
import 'package:moviealike/presentation/screens/movie_details/widgets/movie_dialog.dart';
import 'package:moviealike/presentation/widgets/gradient_box_border.dart';

class MovieRecommendationCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String genre;
  final double rating;
  final double distance; // Add distance metric
  final String overview;
  final VoidCallback onTap;
  final int id;
  final MovieRecommendation movie;
  final double movieWidth;
  final double movieHeight;
  const MovieRecommendationCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.genre,
    required this.rating,
    required this.distance, // Initialize distance
    required this.onTap,
    required this.overview,
    required this.id,
    required this.movie,
    required this.movieWidth,
    required this.movieHeight,
  }) : super(key: key);
  final Color highlyRecommendedColor =
      const Color(0xFF22B07D); // Vibrant Magenta (Your Accent)
  final Color similarColor = const Color(0xFFFF8700); // Vivid Orange-Red
  final Color relatedColor = const Color(0xFFFF7256); // Darker Orange
  String getDistanceLabel(BuildContext context, double distance) {
    if (distance > 0.4) {
      return context.text.highlyRecommended;
    } else if (distance > 0.3) {
      return context.text.similar;
    } else {
      return context.text.related;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            opaque: false, // Make dialog-like
            fullscreenDialog: true,
            barrierDismissible: true,
            pageBuilder: (BuildContext context, _, __) {
              return MovieDetailDialog(
                // Navigate to MovieDetailDialog
                imageUrl: imageUrl,
                title: title,
                genre: genre,
                runtime: "120",
                overview: overview,
                distance: distance,
                id: id,
                rating: rating,
                onSeeMore: () {
                  Future.delayed(const Duration(milliseconds: 300), () {
                    GoRouter.of(context).push('/movie_details/$id');
                  });
                },
                movie: movie,
              );
            },
            transitionsBuilder: (_, Animation<double> animation,
                Animation<double> secondaryAnimation, Widget child) {
              return FadeTransition(
                  opacity: animation, child: child); // Optional fade transition
            },
          ),
        );
      },
      child: Container(
        width: movieWidth,
        height: movieHeight,
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                getRecommendedColor(distance).withValues(alpha: distance * 0.1),
                getRecommendedColor(distance).withValues(alpha: distance * 0.3),
                getRecommendedColor(distance).withValues(alpha: distance * 0.5),
                getRecommendedColor(distance).withValues(alpha: distance),
              ],
              stops: const [
                0.0,
                0.5,
                0.8,
                1
              ]),
          border: GradientBoxBorder(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  getRecommendedColor(distance).withValues(alpha: 0.3),
                  getRecommendedColor(distance).withValues(alpha: 0.3),
                  getRecommendedColor(distance).withValues(alpha: 0.5),
                  getRecommendedColor(distance).withValues(alpha: 0.8),
                ],
                stops: const [
                  0.0,
                  0.5,
                  0.8,
                  1
                ]),
            width: 1.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: 'movie-poster-${title}', // Unique tag for each movie
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(12)),
                    child: RemoteImage(
                      imageUrl: imageUrl,
                      imageBuilder: (context, imageProvider) => Container(
                        width: movieWidth,
                        height: movieHeight,
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
                      placeholder: Container(
                        width: movieWidth,
                        height: movieHeight,
                        color: Colors.transparent,
                        child: Center(
                          child: SvgPicture.asset(AppSvgs.movieIcon,
                              colorFilter: const ColorFilter.mode(
                                  AppColors.accent, BlendMode.srcIn),
                              width: 48),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        width: movieWidth,
                        height: movieHeight,
                        color: Colors.transparent,
                        child: Center(
                          child: SvgPicture.asset(AppSvgs.movieIcon,
                              colorFilter: const ColorFilter.mode(
                                  AppColors.accent, BlendMode.srcIn),
                              width: 48),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.compare,
                            color: AppColors.orange, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '${(distance * 100).toStringAsFixed(0)}%',
                          style: context.typography.heading6.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.typography.heading5.copyWith(
                    color: AppColors.white, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 4, right: 8),
              child: Text(movie.genres?.join(", ") ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: context.typography.heading7.copyWith(
                      color: AppColors.white, fontWeight: FontWeight.normal)),
            ),
          ],
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
