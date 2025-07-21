import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviealike/di/di_setup.dart';
import 'package:moviealike/presentation/screens/movie_details/movie_details_bloc.dart';
import 'package:moviealike/presentation/screens/movie_details/movie_details_screen.dart';

class MovieDetailsEntry extends StatelessWidget {
  final int movieId;
  const MovieDetailsEntry({
    super.key,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieDetailsBloc>(
      create: (context) => MovieDetailsBloc(
        getIt(),
        getIt(),
        getIt(),
        getIt(),
        getIt(),
        getIt(),
        getIt(),
        getIt(),
        movieId,
      )..init(),
      child: const MovieDetailScreen(),
    );
  }
}
