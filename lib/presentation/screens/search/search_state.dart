import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:moviealike/data/search/models/search_type.dart';
import 'package:moviealike/domain/search/models/search_filter.dart';
import 'package:moviealike/domain/search/models/search_item.dart';

part 'search_state.g.dart';

@CopyWith()
class SearchState {
  final bool isLoading;
  final SearchType selectedType;
  final SearchFilter? searchFilter;
  final List<List<SearchItem>>? pages;
  final List<int>? keys;
  final bool hasNextPage;
  final bool hasError;
  final RequestError? error;
  const SearchState({
    this.isLoading = false,
    this.selectedType = SearchType.movie,
    this.searchFilter,
    this.hasError = false,
    this.pages,
    this.keys,
    this.hasNextPage = true,
    this.error,
  });
}
