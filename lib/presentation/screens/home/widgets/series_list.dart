import 'package:flutter/widgets.dart';
import 'package:moviealike/domain/series/models/serie.dart';
import 'package:moviealike/presentation/common/extensions/build_context.dart';
import 'package:moviealike/presentation/screens/home/widgets/movie_tv_card.dart';

class SeriesList extends StatefulWidget {
  final List<Serie> items;
  const SeriesList({super.key, required this.items});

  @override
  State<SeriesList> createState() => _SeriesListState();
}

class _SeriesListState extends State<SeriesList> {
  late final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 520,
      child: ListView.builder(
          controller: controller,
          scrollDirection: Axis.horizontal,
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
            final serie = widget.items[index];
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.dimensionScheme.screenMargin),
              child: MovieTvCard(
                height: 420,
                width: 280,
                onTap: () {},
                name: serie.name ?? "",
                releaseDate: serie.firstAirDate ?? "",
                voteAverage: serie.voteAverage.toString(),
                posterPath:
                    "https://image.tmdb.org/t/p/w780/${serie.posterPath}",
              ),
            );
          }),
    );
  }
}
