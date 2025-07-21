import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moviealike/data/search/models/search_type.dart';
import 'package:moviealike/presentation/common/extensions/build_context.dart';
import 'package:moviealike/presentation/common/style/app_colors.dart';
import 'package:moviealike/presentation/common/style/typography/app_typography_scheme.dart';
import 'package:moviealike/presentation/constants/app_webps.dart';
import 'package:moviealike/presentation/screens/home/home_bloc.dart';
import 'package:moviealike/presentation/screens/home/home_state.dart';
import 'package:moviealike/presentation/screens/home/widgets/custom_search_bar.dart';
import 'package:moviealike/presentation/screens/home/widgets/movie_list.dart';
import 'package:moviealike/presentation/screens/home/widgets/movies_carousel.dart';
import 'package:moviealike/presentation/widgets/error_description_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      extendBodyBehindAppBar: context.isLargeScreen ? false : false,
      body: _HomeScreenContent(
        onTapDiscover: () => GoRouter.of(context).go('/search'),
      ),
    );
  }
}

class _HomeScreenContent extends StatefulWidget {
  final VoidCallback onTapDiscover;

  const _HomeScreenContent({required this.onTapDiscover});
  @override
  State<_HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<_HomeScreenContent> {
  late final _bloc = BlocProvider.of<HomeBloc>(context);
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final styles = AppTypographyScheme.of(context);

        return state.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : state.hasError
                ? ErrorDescriptionWidget(
                    assetPath: AppWebps.folder,
                    requestError: state.error,
                    onTryAgain: () {
                      _bloc.init();
                    })
                : SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 16, top: 40, right: 16, left: 16),
                          child: CustomSearchBar(
                            controller: _searchController,
                            onChanged: (value) {},
                            onFilterPressed: () {
                              //print('Filter button pressed');
                            },
                            onTap: () {
                              GoRouter.of(context).pushReplacement('/search');
                            },
                          ),
                        ),
                        MovieCarousel(
                            movies: state.upcomingMovies.take(5).toList()),
                        SizedBox(
                          height: context.dimensionScheme.screenMargin,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: context.dimensionScheme.screenMargin),
                          child: Row(
                            children: [
                              Text(
                                context.text.mostPopular,
                                style: styles.heading4.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textPrimary),
                              ),
                            ],
                          ),
                        ),
                        if (state.selectedType == SearchType.movie)
                          MovieList(items: state.populaMovies),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.dimensionScheme.screenMargin,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              context.text.upcoming,
                              style: styles.heading4.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                        ),
                        if (state.selectedType == SearchType.movie)
                          MovieList(items: state.upcomingMovies),
                      ],
                    ),
                  );
      },
    );
  }
}
