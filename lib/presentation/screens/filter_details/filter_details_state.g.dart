// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_details_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FilterDetailsStateCWProxy {
  FilterDetailsState personDetails(PersonDetails? personDetails);

  FilterDetailsState companyDetails(CompanyDetails? companyDetails);

  FilterDetailsState pages(List<List<SearchItem>> pages);

  FilterDetailsState keys(List<int> keys);

  FilterDetailsState filterType(SearchFilter? filterType);

  FilterDetailsState filterId(int? filterId);

  FilterDetailsState isLoading(bool isLoading);

  FilterDetailsState hasError(bool hasError);

  FilterDetailsState error(RequestError? error);

  FilterDetailsState hasNextPage(bool hasNextPage);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `FilterDetailsState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FilterDetailsState(...).copyWith(id: 12, name: "My name")
  /// ```
  FilterDetailsState call({
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
/// Use as `instanceOfFilterDetailsState.copyWith(...)` or call `instanceOfFilterDetailsState.copyWith.fieldName(value)` for a single field.
class _$FilterDetailsStateCWProxyImpl implements _$FilterDetailsStateCWProxy {
  const _$FilterDetailsStateCWProxyImpl(this._value);

  final FilterDetailsState _value;

  @override
  FilterDetailsState personDetails(PersonDetails? personDetails) =>
      this(personDetails: personDetails);

  @override
  FilterDetailsState companyDetails(CompanyDetails? companyDetails) =>
      this(companyDetails: companyDetails);

  @override
  FilterDetailsState pages(List<List<SearchItem>> pages) => this(pages: pages);

  @override
  FilterDetailsState keys(List<int> keys) => this(keys: keys);

  @override
  FilterDetailsState filterType(SearchFilter? filterType) =>
      this(filterType: filterType);

  @override
  FilterDetailsState filterId(int? filterId) => this(filterId: filterId);

  @override
  FilterDetailsState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  FilterDetailsState hasError(bool hasError) => this(hasError: hasError);

  @override
  FilterDetailsState error(RequestError? error) => this(error: error);

  @override
  FilterDetailsState hasNextPage(bool hasNextPage) =>
      this(hasNextPage: hasNextPage);

  @override

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `FilterDetailsState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FilterDetailsState(...).copyWith(id: 12, name: "My name")
  /// ```
  FilterDetailsState call({
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
    return FilterDetailsState(
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

extension $FilterDetailsStateCopyWith on FilterDetailsState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfFilterDetailsState.copyWith(...)` or `instanceOfFilterDetailsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FilterDetailsStateCWProxy get copyWith =>
      _$FilterDetailsStateCWProxyImpl(this);
}
