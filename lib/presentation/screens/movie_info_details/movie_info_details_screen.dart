import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:moviealike/domain/search/models/search_item.dart';
import 'package:moviealike/presentation/common/extensions/build_context.dart';
import 'package:moviealike/presentation/common/extensions/string_extension.dart';
import 'package:moviealike/presentation/common/style/app_colors.dart';
import 'package:moviealike/presentation/constants/app_svgs.dart';
import 'package:moviealike/presentation/constants/app_webps.dart';
import 'package:moviealike/presentation/screens/movie_info_details/movie_info_details_bloc.dart';
import 'package:moviealike/presentation/screens/movie_info_details/movie_info_details_state.dart';
import 'package:moviealike/presentation/screens/movie_info_details/widgets/person_details_section.dart';
import 'package:moviealike/presentation/screens/movie_info_details/widgets/company_details_section.dart';
import 'package:moviealike/presentation/screens/movie_details/widgets/section_title.dart';
import 'package:moviealike/presentation/screens/search/widgets/movie_search_card.dart';
import 'package:moviealike/presentation/widgets/error_description_widget.dart';
import 'package:moviealike/presentation/widgets/genres.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MovieInfoDetailsScreen extends StatefulWidget {
  const MovieInfoDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MovieInfoDetailsScreen> createState() => _MovieInfoDetailsScreenState();
}

class _MovieInfoDetailsScreenState extends State<MovieInfoDetailsScreen> {
  late final _bloc = BlocProvider.of<MovieInfoDetailsBloc>(context);
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _bloc.init();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: BlocBuilder<MovieInfoDetailsBloc, MovieInfoDetailsState>(
          builder: (context, state) {
            if (state.isPersonFilter && state.personDetails != null) {
              return Text(
                state.personDetails!.name,
                style: context.typography.heading4.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              );
            } else if (state.isCompanyFilter && state.companyDetails != null) {
              return Text(
                state.companyDetails!.name,
                style: context.typography.heading4.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              );
            }
            return Text(
              "Details",
              style: context.typography.heading4.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            );
          },
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
              colorFilter: const ColorFilter.mode(
                AppColors.white,
                BlendMode.srcIn,
              ),
              height: 24,
              width: 24,
            ),
          ),
        ),
      ),
      body: BlocBuilder<MovieInfoDetailsBloc, MovieInfoDetailsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.accent,
              ),
            );
          }

          if (state.hasError) {
            return ErrorDescriptionWidget(
              assetPath: AppWebps.folder,
              errorMessage: context.text.errorMessage,
              onTryAgain: () => _bloc.retry(),
              requestError: state.error,
            );
          }

          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              if (state.isPersonFilter && state.personDetails != null)
                SliverToBoxAdapter(
                  child:
                      PersonDetailsSection(personDetails: state.personDetails!),
                )
              else if (state.isCompanyFilter && state.companyDetails != null)
                SliverToBoxAdapter(
                  child: CompanyDetailsSection(
                      companyDetails: state.companyDetails!),
                ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: context.dimensionScheme.screenMargin,
                    right: context.dimensionScheme.screenMargin,
                    top: 24,
                    bottom: 16,
                  ),
                  child: SectionTitle(title: context.text.movies.capitalized),
                ),
              ),
              if (state.hasError && state.pages.isEmpty)
                SliverToBoxAdapter(
                  child: _buildErrorState(context),
                )
              else if (state.pages.isEmpty)
                SliverToBoxAdapter(
                  child: _buildEmptyState(context),
                )
              else
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.dimensionScheme.screenMargin,
                  ),
                  sliver: PagedSliverList(
                    state: PagingState(
                      pages: state.pages,
                      keys: state.keys,
                      hasNextPage: state.hasNextPage,
                    ),
                    fetchNextPage: _bloc.loadNextPage,
                    builderDelegate: PagedChildBuilderDelegate<SearchItem>(
                      itemBuilder: (context, item, index) {
                        final searchItem = item;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: MovieSearchCard(
                            onTap: () {
                              GoRouter.of(context)
                                  .push('/movie_details/${searchItem.id}');
                            },
                            title: searchItem.title ?? searchItem.name ?? "",
                            genre: searchItem.genreIds?.isNotEmpty == true
                                ? searchItem.genreIds!
                                    .map((e) => Genre.getById(e)?.name ?? "")
                                    .toList()
                                    .first
                                : "",
                            rating: searchItem.voteAverage.toString(),
                            imageUrl:
                                "https://image.tmdb.org/t/p/w780/${searchItem.posterPath}",
                            year: searchItem.firstAirDate ?? "",
                            duration: searchItem.mediaType ?? "",
                            type: searchItem.mediaType ?? "",
                          ),
                        );
                      },
                    ),
                  ),
                ),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
            ],
          );
        },
      ),
    );
  }

  Widget _buildErrorState(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          const Icon(
            Icons.error_outline,
            color: AppColors.red,
            size: 48,
          ),
          const SizedBox(height: 16),
          Text(
            context.text.errorMessage,
            style: context.typography.heading5.copyWith(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => _bloc.retryMovies(),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accent,
              foregroundColor: Colors.white,
            ),
            child: Text(context.text.tryAgain),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          const Icon(
            Icons.movie_outlined,
            color: AppColors.grey,
            size: 48,
          ),
          const SizedBox(height: 16),
          Text(
            "No movies found",
            style: context.typography.heading5.copyWith(
              color: Colors.white.withValues(alpha: (0.6)),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
