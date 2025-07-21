import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moviealike/data/search/models/search_type.dart';
import 'package:moviealike/domain/search/models/search_item.dart';
import 'package:moviealike/presentation/common/extensions/build_context.dart';
import 'package:moviealike/presentation/common/style/app_colors.dart';
import 'package:moviealike/presentation/constants/app_webps.dart';
import 'package:moviealike/presentation/screens/home/widgets/custom_search_bar.dart';
import 'package:moviealike/presentation/screens/search/search_bloc.dart';
import 'package:moviealike/presentation/screens/search/search_state.dart';
import 'package:moviealike/presentation/screens/search/widgets/movie_search_card.dart';
import 'package:moviealike/presentation/widgets/error_description_widget.dart';
import 'package:moviealike/presentation/widgets/genres.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SearchScreen extends StatefulWidget {
  final SearchType initialSearchType;
  const SearchScreen({Key? key, required this.initialSearchType})
      : super(key: key);

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  late final _bloc = BlocProvider.of<SearchBloc>(context);
  int page = 1;
  bool isNewSearch = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) => Scaffold(
        backgroundColor: AppColors.primary,
        extendBodyBehindAppBar: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8, top: 40),
                  child: CustomSearchBar(
                    controller: _searchController,
                    onChanged: (value) {
                      _bloc.onQueryChanged(value);
                    },
                    onFilterPressed: () {},
                  ),
                ),
              ),
              Expanded(
                child: state.isLoading
                    ? SizedBox(
                        height: MediaQuery.sizeOf(context).height / 2,
                        child: const Center(child: CircularProgressIndicator()),
                      )
                    : state.hasError
                        ? SizedBox(
                            height: MediaQuery.sizeOf(context).height / 2,
                            child: Center(
                                child: ErrorDescriptionWidget(
                              assetPath: AppWebps.noResults,
                              errorMessage: context.text.errorMessage,
                              onTryAgain: () {
                                _bloc.onQueryChanged(_searchController.text);
                              },
                              requestError: state.error,
                            )),
                          )
                        : PagedListView(
                            state: PagingState(
                              pages: state.pages,
                              keys: state.keys,
                              hasNextPage: state.hasNextPage,
                            ),
                            fetchNextPage: _bloc.loadNextPage,
                            builderDelegate:
                                PagedChildBuilderDelegate<SearchItem>(
                                    itemBuilder: (context, item, index) {
                              final searchItem = item;
                              return MovieSearchCard(
                                onTap: () {
                                  GoRouter.of(context)
                                      .push('/movie_details/${searchItem.id}');
                                },
                                title:
                                    searchItem.title ?? searchItem.name ?? "",
                                genre: searchItem.genreIds?.isNotEmpty == true
                                    ? searchItem.genreIds!
                                        .map(
                                            (e) => Genre.getById(e)?.name ?? "")
                                        .toList()
                                        .first
                                    : "",
                                rating: searchItem.voteAverage.toString(),
                                imageUrl:
                                    "https://image.tmdb.org/t/p/w780/${searchItem.posterPath}",
                                year: searchItem.firstAirDate ?? "",
                                duration: searchItem.mediaType ?? "",
                                type: searchItem.mediaType ?? "",
                              );
                            }),
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
