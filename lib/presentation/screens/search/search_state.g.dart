// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SearchStateCWProxy {
  SearchState isLoading(bool isLoading);

  SearchState selectedType(SearchType selectedType);

  SearchState searchFilter(SearchFilter? searchFilter);

  SearchState hasError(bool hasError);

  SearchState pages(List<List<SearchItem>>? pages);

  SearchState keys(List<int>? keys);

  SearchState hasNextPage(bool hasNextPage);

  SearchState error(RequestError? error);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `SearchState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SearchState(...).copyWith(id: 12, name: "My name")
  /// ```
  SearchState call({
    bool isLoading,
    SearchType selectedType,
    SearchFilter? searchFilter,
    bool hasError,
    List<List<SearchItem>>? pages,
    List<int>? keys,
    bool hasNextPage,
    RequestError? error,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfSearchState.copyWith(...)` or call `instanceOfSearchState.copyWith.fieldName(value)` for a single field.
class _$SearchStateCWProxyImpl implements _$SearchStateCWProxy {
  const _$SearchStateCWProxyImpl(this._value);

  final SearchState _value;

  @override
  SearchState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  SearchState selectedType(SearchType selectedType) =>
      this(selectedType: selectedType);

  @override
  SearchState searchFilter(SearchFilter? searchFilter) =>
      this(searchFilter: searchFilter);

  @override
  SearchState hasError(bool hasError) => this(hasError: hasError);

  @override
  SearchState pages(List<List<SearchItem>>? pages) => this(pages: pages);

  @override
  SearchState keys(List<int>? keys) => this(keys: keys);

  @override
  SearchState hasNextPage(bool hasNextPage) => this(hasNextPage: hasNextPage);

  @override
  SearchState error(RequestError? error) => this(error: error);

  @override

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `SearchState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// SearchState(...).copyWith(id: 12, name: "My name")
  /// ```
  SearchState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? selectedType = const $CopyWithPlaceholder(),
    Object? searchFilter = const $CopyWithPlaceholder(),
    Object? hasError = const $CopyWithPlaceholder(),
    Object? pages = const $CopyWithPlaceholder(),
    Object? keys = const $CopyWithPlaceholder(),
    Object? hasNextPage = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
  }) {
    return SearchState(
      isLoading: isLoading == const $CopyWithPlaceholder()
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      selectedType: selectedType == const $CopyWithPlaceholder()
          ? _value.selectedType
          // ignore: cast_nullable_to_non_nullable
          : selectedType as SearchType,
      searchFilter: searchFilter == const $CopyWithPlaceholder()
          ? _value.searchFilter
          // ignore: cast_nullable_to_non_nullable
          : searchFilter as SearchFilter?,
      hasError: hasError == const $CopyWithPlaceholder()
          ? _value.hasError
          // ignore: cast_nullable_to_non_nullable
          : hasError as bool,
      pages: pages == const $CopyWithPlaceholder()
          ? _value.pages
          // ignore: cast_nullable_to_non_nullable
          : pages as List<List<SearchItem>>?,
      keys: keys == const $CopyWithPlaceholder()
          ? _value.keys
          // ignore: cast_nullable_to_non_nullable
          : keys as List<int>?,
      hasNextPage: hasNextPage == const $CopyWithPlaceholder()
          ? _value.hasNextPage
          // ignore: cast_nullable_to_non_nullable
          : hasNextPage as bool,
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as RequestError?,
    );
  }
}

extension $SearchStateCopyWith on SearchState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfSearchState.copyWith(...)` or `instanceOfSearchState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SearchStateCWProxy get copyWith => _$SearchStateCWProxyImpl(this);
}
