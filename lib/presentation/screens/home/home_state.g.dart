// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HomeStateCWProxy {
  HomeState populaMovies(List<Movie> populaMovies);

  HomeState isLoading(bool isLoading);

  HomeState backgroundImage(String? backgroundImage);

  HomeState upcomingMovies(List<Movie> upcomingMovies);

  HomeState popularSeries(List<Serie> popularSeries);

  HomeState upcomingSeries(List<Serie> upcomingSeries);

  HomeState selectedType(SearchType selectedType);

  HomeState hasError(bool hasError);

  HomeState error(RequestError? error);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HomeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HomeState(...).copyWith(id: 12, name: "My name")
  /// ````
  HomeState call({
    List<Movie>? populaMovies,
    bool? isLoading,
    String? backgroundImage,
    List<Movie>? upcomingMovies,
    List<Serie>? popularSeries,
    List<Serie>? upcomingSeries,
    SearchType? selectedType,
    bool? hasError,
    RequestError? error,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHomeState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHomeState.copyWith.fieldName(...)`
class _$HomeStateCWProxyImpl implements _$HomeStateCWProxy {
  const _$HomeStateCWProxyImpl(this._value);

  final HomeState _value;

  @override
  HomeState populaMovies(List<Movie> populaMovies) =>
      this(populaMovies: populaMovies);

  @override
  HomeState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  HomeState backgroundImage(String? backgroundImage) =>
      this(backgroundImage: backgroundImage);

  @override
  HomeState upcomingMovies(List<Movie> upcomingMovies) =>
      this(upcomingMovies: upcomingMovies);

  @override
  HomeState popularSeries(List<Serie> popularSeries) =>
      this(popularSeries: popularSeries);

  @override
  HomeState upcomingSeries(List<Serie> upcomingSeries) =>
      this(upcomingSeries: upcomingSeries);

  @override
  HomeState selectedType(SearchType selectedType) =>
      this(selectedType: selectedType);

  @override
  HomeState hasError(bool hasError) => this(hasError: hasError);

  @override
  HomeState error(RequestError? error) => this(error: error);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HomeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HomeState(...).copyWith(id: 12, name: "My name")
  /// ````
  HomeState call({
    Object? populaMovies = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? backgroundImage = const $CopyWithPlaceholder(),
    Object? upcomingMovies = const $CopyWithPlaceholder(),
    Object? popularSeries = const $CopyWithPlaceholder(),
    Object? upcomingSeries = const $CopyWithPlaceholder(),
    Object? selectedType = const $CopyWithPlaceholder(),
    Object? hasError = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
  }) {
    return HomeState(
      populaMovies:
          populaMovies == const $CopyWithPlaceholder() || populaMovies == null
              ? _value.populaMovies
              // ignore: cast_nullable_to_non_nullable
              : populaMovies as List<Movie>,
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      backgroundImage: backgroundImage == const $CopyWithPlaceholder()
          ? _value.backgroundImage
          // ignore: cast_nullable_to_non_nullable
          : backgroundImage as String?,
      upcomingMovies: upcomingMovies == const $CopyWithPlaceholder() ||
              upcomingMovies == null
          ? _value.upcomingMovies
          // ignore: cast_nullable_to_non_nullable
          : upcomingMovies as List<Movie>,
      popularSeries:
          popularSeries == const $CopyWithPlaceholder() || popularSeries == null
              ? _value.popularSeries
              // ignore: cast_nullable_to_non_nullable
              : popularSeries as List<Serie>,
      upcomingSeries: upcomingSeries == const $CopyWithPlaceholder() ||
              upcomingSeries == null
          ? _value.upcomingSeries
          // ignore: cast_nullable_to_non_nullable
          : upcomingSeries as List<Serie>,
      selectedType:
          selectedType == const $CopyWithPlaceholder() || selectedType == null
              ? _value.selectedType
              // ignore: cast_nullable_to_non_nullable
              : selectedType as SearchType,
      hasError: hasError == const $CopyWithPlaceholder() || hasError == null
          ? _value.hasError
          // ignore: cast_nullable_to_non_nullable
          : hasError as bool,
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as RequestError?,
    );
  }
}

extension $HomeStateCopyWith on HomeState {
  /// Returns a callable class that can be used as follows: `instanceOfHomeState.copyWith(...)` or like so:`instanceOfHomeState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HomeStateCWProxy get copyWith => _$HomeStateCWProxyImpl(this);
}
