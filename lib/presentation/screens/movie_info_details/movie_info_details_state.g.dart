// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_info_details_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MovieInfoDetailsStateCWProxy {
  MovieInfoDetailsState personDetails(PersonDetails? personDetails);

  MovieInfoDetailsState companyDetails(CompanyDetails? companyDetails);

  MovieInfoDetailsState pages(List<List<SearchItem>> pages);

  MovieInfoDetailsState keys(List<int> keys);

  MovieInfoDetailsState filterType(SearchFilter? filterType);

  MovieInfoDetailsState filterId(int? filterId);

  MovieInfoDetailsState isLoading(bool isLoading);

  MovieInfoDetailsState hasError(bool hasError);

  MovieInfoDetailsState error(RequestError? error);

  MovieInfoDetailsState hasNextPage(bool hasNextPage);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `MovieInfoDetailsState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MovieInfoDetailsState(...).copyWith(id: 12, name: "My name")
  /// ```
  MovieInfoDetailsState call({
    PersonDetails? personDetails,
    CompanyDetails? companyDetails,
    List<List<SearchItem>> pages,
    List<int> keys,
    SearchFilter? filterType,
    int? filterId,
    bool isLoading,
    bool hasError,
    RequestError? error,
    bool hasNextPage,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfMovieInfoDetailsState.copyWith(...)` or call `instanceOfMovieInfoDetailsState.copyWith.fieldName(value)` for a single field.
class _$MovieInfoDetailsStateCWProxyImpl
    implements _$MovieInfoDetailsStateCWProxy {
  const _$MovieInfoDetailsStateCWProxyImpl(this._value);

  final MovieInfoDetailsState _value;

  @override
  MovieInfoDetailsState personDetails(PersonDetails? personDetails) =>
      this(personDetails: personDetails);

  @override
  MovieInfoDetailsState companyDetails(CompanyDetails? companyDetails) =>
      this(companyDetails: companyDetails);

  @override
  MovieInfoDetailsState pages(List<List<SearchItem>> pages) =>
      this(pages: pages);

  @override
  MovieInfoDetailsState keys(List<int> keys) => this(keys: keys);

  @override
  MovieInfoDetailsState filterType(SearchFilter? filterType) =>
      this(filterType: filterType);

  @override
  MovieInfoDetailsState filterId(int? filterId) => this(filterId: filterId);

  @override
  MovieInfoDetailsState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  MovieInfoDetailsState hasError(bool hasError) => this(hasError: hasError);

  @override
  MovieInfoDetailsState error(RequestError? error) => this(error: error);

  @override
  MovieInfoDetailsState hasNextPage(bool hasNextPage) =>
      this(hasNextPage: hasNextPage);

  @override

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `MovieInfoDetailsState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MovieInfoDetailsState(...).copyWith(id: 12, name: "My name")
  /// ```
  MovieInfoDetailsState call({
    Object? personDetails = const $CopyWithPlaceholder(),
    Object? companyDetails = const $CopyWithPlaceholder(),
    Object? pages = const $CopyWithPlaceholder(),
    Object? keys = const $CopyWithPlaceholder(),
    Object? filterType = const $CopyWithPlaceholder(),
    Object? filterId = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? hasError = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
    Object? hasNextPage = const $CopyWithPlaceholder(),
  }) {
    return MovieInfoDetailsState(
      personDetails: personDetails == const $CopyWithPlaceholder()
          ? _value.personDetails
          // ignore: cast_nullable_to_non_nullable
          : personDetails as PersonDetails?,
      companyDetails: companyDetails == const $CopyWithPlaceholder()
          ? _value.companyDetails
          // ignore: cast_nullable_to_non_nullable
          : companyDetails as CompanyDetails?,
      pages: pages == const $CopyWithPlaceholder()
          ? _value.pages
          // ignore: cast_nullable_to_non_nullable
          : pages as List<List<SearchItem>>,
      keys: keys == const $CopyWithPlaceholder()
          ? _value.keys
          // ignore: cast_nullable_to_non_nullable
          : keys as List<int>,
      filterType: filterType == const $CopyWithPlaceholder()
          ? _value.filterType
          // ignore: cast_nullable_to_non_nullable
          : filterType as SearchFilter?,
      filterId: filterId == const $CopyWithPlaceholder()
          ? _value.filterId
          // ignore: cast_nullable_to_non_nullable
          : filterId as int?,
      isLoading: isLoading == const $CopyWithPlaceholder()
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      hasError: hasError == const $CopyWithPlaceholder()
          ? _value.hasError
          // ignore: cast_nullable_to_non_nullable
          : hasError as bool,
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as RequestError?,
      hasNextPage: hasNextPage == const $CopyWithPlaceholder()
          ? _value.hasNextPage
          // ignore: cast_nullable_to_non_nullable
          : hasNextPage as bool,
    );
  }
}

extension $MovieInfoDetailsStateCopyWith on MovieInfoDetailsState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfMovieInfoDetailsState.copyWith(...)` or `instanceOfMovieInfoDetailsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MovieInfoDetailsStateCWProxy get copyWith =>
      _$MovieInfoDetailsStateCWProxyImpl(this);
}
