import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviealike/di/di_setup.dart';
import 'package:moviealike/presentation/screens/whatchlist/watch_list_bloc.dart';
import 'package:moviealike/presentation/screens/whatchlist/watch_list_screen.dart';

class WatchListEntry extends StatelessWidget {
  static const path = '/watchlist';
  const WatchListEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WatchListBloc>(
      create: (context) => WatchListBloc(
        getIt(),
        getIt(),
      )..init(),
      child: const WatchlistScreen(),
    );
  }
}
