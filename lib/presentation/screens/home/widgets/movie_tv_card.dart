import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moviealike/presentation/common/style/typography/app_typography_scheme.dart';
import 'package:moviealike/presentation/widgets/container_with_ripple_effect.dart';

class MovieTvCard extends StatelessWidget {
  final String name;
  final String releaseDate;
  final String voteAverage;
  final String posterPath;
  final double height;
  final double? imageHeight;
  final double? imageWidth;
  final double width;
  final VoidCallback onTap;
  const MovieTvCard({
    super.key,
    required this.name,
    required this.releaseDate,
    required this.voteAverage,
    required this.posterPath,
    required this.onTap,
    required this.height,
    required this.width,
    this.imageHeight,
    this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    final typography = AppTypographyScheme.of(context);
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContainerWithRippleEffect(
            onTap: onTap,
            child: Image.network(
              posterPath,
              width: width,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: SizedBox(
              height: 24,
              child: Text(
                name,
                textAlign: TextAlign.start,
                style: typography.heading6.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),

          // SizedBox(
          //   height: 24,
          //   child: Row(
          //     children: [
          //       Text(
          //         "$releaseDate ",
          //         textAlign: TextAlign.start,
          //         style: typography.body1.copyWith(
          //           fontWeight: FontWeight.bold,
          //         ),
          //         maxLines: 1,
          //         overflow: TextOverflow.ellipsis,
          //       ),
          //       // Text(
          //       //   "- $voteAverage",
          //       //   textAlign: TextAlign.end,
          //       //   style: typography.body1.copyWith(
          //       //     fontWeight: FontWeight.bold,
          //       //   ),
          //       //   maxLines: 1,
          //       //   overflow: TextOverflow.ellipsis,
          //       // ),
          //       // const SizedBox(
          //       //   width: 4,
          //       // ),
          //       // const Icon(
          //       //   Icons.star,
          //       //   color: Colors.yellow,
          //       // ),
          //     ],
          //   ),
          // )
        ]);
  }
}
