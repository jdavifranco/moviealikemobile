import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviealike/di/di_setup.dart';
import 'package:moviealike/domain/search/models/search_filter.dart';
import 'package:moviealike/presentation/screens/movie_info_details/movie_info_details_bloc.dart';
import 'package:moviealike/presentation/screens/movie_info_details/movie_info_details_screen.dart';

class MovieInfoDetailsEntry extends StatelessWidget {
  final SearchFilter filterType;
  final int filterId;

  const MovieInfoDetailsEntry({
    Key? key,
    required this.filterType,
    required this.filterId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieInfoDetailsBloc(
        getIt(),
        getIt(),
        getIt(),
        filterType,
        filterId,
      ),
      child: const MovieInfoDetailsScreen(),
    );
  }
}
