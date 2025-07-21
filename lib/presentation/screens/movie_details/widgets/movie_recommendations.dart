import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moviealike/domain/recommendations/models/movie_recommendation.dart';
import 'package:moviealike/presentation/common/extensions/build_context.dart';
import 'package:moviealike/presentation/common/extensions/text_style_extensions.dart';
import 'package:moviealike/presentation/screens/movie_details/widgets/movie_recommendation_card.dart';

class MovieRecommendations extends StatefulWidget {
  final List<MovieRecommendation> items;
  const MovieRecommendations({
    super.key,
    required this.items,
  });

  @override
  State<MovieRecommendations> createState() => _MovieListState();
}

class _MovieListState extends State<MovieRecommendations> {
  late final controller = ScrollController();
  late int textSize = 50;
  late double movieWidth;
  late double movieHeight;
  late double padding = 30;
  @override
  void didChangeDependencies() {
    movieWidth = min(MediaQuery.of(context).size.width / 3, 200).toDouble();
    movieHeight = movieWidth / 0.66;

    textSize = context.typography.heading5
            .getTextSize(context: context, maxLines: 1, maxWidth: movieWidth)
            .height
            .toInt() +
        context.typography.heading7
            .getTextSize(context: context, maxLines: 1, maxWidth: movieWidth)
            .height
            .toInt();
    print(textSize);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: context.dimensionScheme.screenMargin,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: movieHeight + textSize + padding,
        child: Stack(
          children: [
            ListView.builder(
                shrinkWrap: true,
                controller: controller,
                scrollDirection: Axis.horizontal,
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  final movie = widget.items[index];
                  return Padding(
                    padding: EdgeInsets.only(
                        left: index == 0 ? 12 : 6,
                        right: index == widget.items.length - 1 ? 12 : 6),
                    child: MovieRecommendationCard(
                      onTap: () {
                        GoRouter.of(context).push('/movie_details/${movie.id}');
                      },
                      title: movie.title ?? "",
                      genre: "Action",
                      rating: movie.voteAverage ?? 5.0,
                      imageUrl:
                          "https://image.tmdb.org/t/p/w342/${movie.posterPath}",
                      distance: movie.similarity,
                      overview: movie.overview ?? "",
                      id: movie.id,
                      movie: movie,
                      movieWidth: movieWidth,
                      movieHeight: movieHeight,
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
