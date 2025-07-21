import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moviealike/domain/movies/models/movie.dart';
import 'package:moviealike/presentation/common/extensions/build_context.dart';
import 'package:moviealike/presentation/common/extensions/text_style_extensions.dart';
import 'package:moviealike/presentation/screens/home/widgets/movie_card.dart';
import 'package:moviealike/presentation/widgets/genres.dart';

class MovieList extends StatefulWidget {
  final List<Movie> items;
  const MovieList({super.key, required this.items});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late final controller = ScrollController();
  late double textSize = 50.0;
  late double movieWidth;
  late double movieHeight;
  final double padding = 28.0;
  @override
  void didChangeDependencies() {
    movieWidth = min(MediaQuery.of(context).size.width / 3, 200).toDouble();
    movieHeight = movieWidth / 0.66;
    textSize = (context.typography.heading5
                .copyWith(fontWeight: FontWeight.w500)
                .getTextSize(
                    context: context, maxLines: 1, maxWidth: movieWidth)
                .height +
            context.typography.heading7
                .copyWith(fontWeight: FontWeight.normal)
                .getTextSize(context: context, maxWidth: movieWidth)
                .height +
            padding)
        .roundToDouble();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: movieHeight + textSize,
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
                    child: MovieCard(
                      movieWidth: movieWidth,
                      movieHeight: movieHeight,
                      onTap: () {
                        GoRouter.of(context).push('/movie_details/${movie.id}');
                      },
                      title: movie.title ?? "",
                      genre: movie.genreIds
                              ?.map((e) => Genre.getById(e)?.name ?? "")
                              .join(", ") ??
                          "",
                      rating: movie.voteAverage ?? 5.0,
                      imageUrl:
                          "https://image.tmdb.org/t/p/w342/${movie.posterPath}",
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
