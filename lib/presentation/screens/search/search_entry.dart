import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviealike/data/search/models/search_type.dart';
import 'package:moviealike/di/di_setup.dart';
import 'package:moviealike/domain/search/models/search_filter.dart';
import 'package:moviealike/presentation/screens/search/search_bloc.dart';
import 'package:moviealike/presentation/screens/search/search_screen.dart';

class SearchEntry extends StatelessWidget {
  static const path = '/search';
  final SearchType searchType;
  final String? initialQuery;
  final SearchFilter? filter;

  const SearchEntry({
    super.key,
    required this.searchType,
    this.initialQuery,
    this.filter,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (context) => SearchBloc(
        searchMovieOrSeriesByTitle: getIt(),
        getPopularMovies: getIt(),
        searchMovieWithFilter: getIt(),
        initialSearchType: searchType,
      )..init(type: searchType, query: initialQuery, filter: filter),
      child: SearchScreen(
        initialSearchType: searchType,
      ),
    );
  }
}
