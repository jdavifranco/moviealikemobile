import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:moviealike/presentation/common/extensions/build_context.dart';
import 'package:moviealike/presentation/common/remote_image/remote_image.dart';
import 'package:moviealike/presentation/common/style/app_colors.dart';
import 'package:moviealike/presentation/constants/app_svgs.dart';
import 'package:moviealike/presentation/constants/app_webps.dart';
import 'package:moviealike/presentation/screens/movie_details/movie_details_bloc.dart';
import 'package:moviealike/presentation/screens/movie_details/movie_details_state.dart';
import 'package:moviealike/presentation/screens/movie_details/widgets/cast_and_crew_list.dart';
import 'package:moviealike/presentation/screens/movie_details/widgets/genres_list.dart';
import 'package:moviealike/presentation/screens/movie_details/widgets/movie_recommendations.dart';
import 'package:moviealike/presentation/screens/movie_details/widgets/production_company_list.dart';
import 'package:moviealike/presentation/screens/movie_details/widgets/production_countries_list.dart';
import 'package:moviealike/presentation/screens/movie_details/widgets/section_title.dart';
import 'package:moviealike/presentation/screens/movie_details/widgets/watch_provider_list.dart';
import 'package:moviealike/presentation/screens/movie_details/widgets/movie_videos.dart';
import 'package:moviealike/presentation/widgets/error_description_widget.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late final _bloc = BlocProvider.of<MovieDetailsBloc>(context);
  final _scrollController = ScrollController();
  bool isScrolled = false;
  bool showYouTubePlayer = false; // Track if the YouTube player should be shown

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        if (isScrolled != _scrollController.offset >= kToolbarHeight) {
          setState(() {
            isScrolled = _scrollController.offset >= kToolbarHeight;
          });
        }
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final movieWidth =
        min(MediaQuery.sizeOf(context).width / 1.5, 300).toDouble();
    final movieHeight = movieWidth / context.dimensionScheme.heightRation;
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.primary,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: !isScrolled
              ? Colors.transparent
              : AppColors.primary.withAlpha(229),
          centerTitle: true,
          title: state.selectedMovieDetails != null &&
                  state.selectedMovieDetails?.movieImages?.logos?.firstOrNull
                          ?.filePath !=
                      null
              ? SizedBox(
                  child: Image.network(
                    height: kToolbarHeight,
                    "https://image.tmdb.org/t/p/w300/${state.selectedMovieDetails?.movieImages?.logos?.firstOrNull?.filePath}",
                    fit: BoxFit.contain,
                  ),
                )
              : Text(
                  state.selectedMovieDetails?.title ?? "",
                  style: context.typography.heading2.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: AppColors.secondary.withAlpha(120),
                borderRadius: BorderRadius.circular(12),
              ),
              child: SvgPicture.asset(
                AppSvgs.arrowBackIcon,
                colorFilter:
                    const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                height: 24,
                width: 24,
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                _bloc.addToWatchList();
              },
              icon: Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: AppColors.secondary.withAlpha(120),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SvgPicture.asset(
                    AppSvgs.heartIcon,
                    height: 17,
                    colorFilter: ColorFilter.mode(
                        state.isFavorite ? AppColors.red : AppColors.white,
                        BlendMode.srcIn),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: state.isLoading
            ? const Center(child: CircularProgressIndicator())
            : state.hasError
                ? ErrorDescriptionWidget(
                    assetPath: AppWebps.folder,
                    errorMessage: context.text.errorMessage,
                    onTryAgain: () => context.read<MovieDetailsBloc>().init(),
                    requestError: state.error,
                  )
                : SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          fit: StackFit.loose,
                          alignment: Alignment.topCenter,
                          children: [
                            RemoteImage(
                              imageUrl:
                                  "https://image.tmdb.org/t/p/w780/${state.selectedMovieDetails?.backdropPath}",
                              fit: BoxFit.cover,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.width / 0.66,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              placeholder: SizedBox(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.width / 0.66,
                                child: Center(
                                  child: SvgPicture.asset(
                                    AppSvgs.movieIcon,
                                    colorFilter: const ColorFilter.mode(
                                        AppColors.accent, BlendMode.srcIn),
                                    width: 48,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.width / 0.66,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    stops: const [
                                      0,
                                      1
                                    ],
                                    colors: [
                                      AppColors.primary.withOpacity(0.7),
                                      AppColors.primary,
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                                backgroundBlendMode: BlendMode.srcOver,
                              ),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: kToolbarHeight +
                                      40 +
                                      context.dimensionScheme
                                          .movieDetailsTopPadding +
                                      16,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: RemoteImage(
                                    imageUrl:
                                        "https://image.tmdb.org/t/p/w780/${state.selectedMovieDetails?.backdropPath}",
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      width: movieWidth,
                                      height: movieHeight,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    placeholder: SizedBox(
                                      width: movieWidth,
                                      height: movieWidth / 0.66,
                                      child: const Center(),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          _buildDetailItem(
                                              AppSvgs.calendarIcon,
                                              state.selectedMovieDetails
                                                      ?.releaseDate
                                                      ?.split("-")
                                                      .first ??
                                                  ""),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12),
                                            child: Text(
                                              "|",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          if (state.selectedMovieDetails
                                                      ?.runtime !=
                                                  null &&
                                              (state.selectedMovieDetails
                                                          ?.runtime ??
                                                      0) >
                                                  0) ...[
                                            _buildDetailItem(AppSvgs.clockIcon,
                                                "${state.selectedMovieDetails?.runtime.toString()} ${context.text.minutes}"),
                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 12),
                                              child: Text(
                                                "|",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                          _buildDetailItem(
                                              AppSvgs.movieIcon,
                                              state.selectedMovieDetails?.genres
                                                      ?.first.name ??
                                                  ""),
                                        ],
                                      ),
                                    ),
                                    if (state.selectedMovieDetails
                                                ?.voteAverage !=
                                            null &&
                                        state.selectedMovieDetails!
                                                .voteAverage! >
                                            0)
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.star,
                                              color: AppColors.orange,
                                              size: 24),
                                          const SizedBox(width: 4),
                                          Text(
                                            (state.selectedMovieDetails
                                                        ?.voteAverage ??
                                                    0)
                                                .toStringAsFixed(2),
                                            style: context.typography.heading4
                                                .copyWith(
                                                    color: AppColors.orange,
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: movieHeight + 216,
                                ),
                                if (state.selectedMovieDetails?.genres !=
                                        null &&
                                    state.selectedMovieDetails!.genres!
                                        .isNotEmpty)
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 16,
                                        left: context
                                            .dimensionScheme.screenMargin,
                                        right: context
                                            .dimensionScheme.screenMargin),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SectionTitle(
                                            title: context.text.genres),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        GenresList(
                                            genres: state.selectedMovieDetails
                                                    ?.genres ??
                                                [],
                                            onTap: (genre) {
                                              GoRouter.of(context).push(
                                                  '/search/${genre.id}/with_genres');
                                            }),
                                      ],
                                    ),
                                  ),
                                if (state.youtubeVideos.isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 24),
                                    child: MovieVideos(
                                      videos: state.youtubeVideos,
                                    ),
                                  ),
                                if (state.selectedMovieDetails?.overview !=
                                        null &&
                                    state.selectedMovieDetails!.overview
                                        .isNotEmpty)
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 24,
                                        left: context
                                            .dimensionScheme.screenMargin,
                                        right: context
                                            .dimensionScheme.screenMargin),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SectionTitle(
                                              title: context.text.overview),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            state.selectedMovieDetails
                                                    ?.overview ??
                                                "",
                                            style: context.typography.heading5
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.normal),
                                          ),
                                        ]),
                                  ),
                                if (state.selectedMovieDetails?.providers
                                        ?.watchProviders.isNotEmpty ==
                                    true)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 24),
                                    child: WatchProvidersList(
                                        watchProviders: state
                                            .selectedMovieDetails!
                                            .providers!
                                            .watchProviders),
                                  ),
                                if (state.castMembers.isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 24),
                                    child: CastAndCrewList(
                                      members: state.castMembers,
                                      isLoading: false,
                                      onTap: (castId) {
                                        GoRouter.of(context).push(
                                            '/search/$castId/with_people');
                                      },
                                    ),
                                  ),
                                if (state.modelRecommendations.isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 24),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: context
                                                .dimensionScheme.screenMargin,
                                          ),
                                          child: SectionTitle(
                                              title:
                                                  context.text.recommendations),
                                        ),
                                        MovieRecommendations(
                                          items: state.modelRecommendations,
                                        ),
                                      ],
                                    ),
                                  ),
                                if (state.selectedMovieDetails
                                            ?.productionCountries !=
                                        null &&
                                    state.selectedMovieDetails!
                                        .productionCountries!.isNotEmpty)
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 24,
                                        left: context
                                            .dimensionScheme.screenMargin,
                                        right: context
                                            .dimensionScheme.screenMargin),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SectionTitle(
                                            title: context
                                                .text.productionCountries),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        ProductionCountriesList(
                                            countries: state
                                                    .selectedMovieDetails
                                                    ?.productionCountries ??
                                                [],
                                            onTap: (country) {
                                              GoRouter.of(context).push(
                                                  '/search/${country.iso31661}/with_origin_country');
                                            }),
                                      ],
                                    ),
                                  ),
                                if (state.selectedMovieDetails
                                            ?.productionCompanies !=
                                        null &&
                                    state.selectedMovieDetails!
                                        .productionCompanies!.isNotEmpty)
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 24,
                                        left: context
                                            .dimensionScheme.screenMargin,
                                        right: context
                                            .dimensionScheme.screenMargin),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SectionTitle(
                                            title: context
                                                .text.productionCompanies),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        ProductionCompanyList(
                                            companies: state
                                                    .selectedMovieDetails
                                                    ?.productionCompanies ??
                                                [],
                                            onTap: (company) {
                                              GoRouter.of(context).push(
                                                  '/search/${company.id}/with_companies');
                                            }),
                                      ],
                                    ),
                                  ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }

  Widget _buildDetailItem(String iconAsset, String text) {
    return Row(
      children: [
        SvgPicture.asset(iconAsset,
            colorFilter:
                const ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
            height: 16),
        const SizedBox(width: 4),
        Text(
          text,
          style: context.typography.heading5
              .copyWith(color: Colors.white, fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
