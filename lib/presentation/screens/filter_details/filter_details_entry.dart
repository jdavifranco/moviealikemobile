import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviealike/di/di_setup.dart';
import 'package:moviealike/domain/search/models/search_filter.dart';
import 'package:moviealike/presentation/screens/filter_details/filter_details_bloc.dart';
import 'package:moviealike/presentation/screens/filter_details/filter_details_screen.dart';

class FilterDetailsEntry extends StatelessWidget {
  final SearchFilter filterType;
  final int filterId;

  const FilterDetailsEntry({
    Key? key,
    required this.filterType,
    required this.filterId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilterDetailsBloc(
        getIt(),
        getIt(),
        getIt(),
        filterType,
        filterId,
      ),
      child: const FilterDetailsScreen(),
    );
  }
}
