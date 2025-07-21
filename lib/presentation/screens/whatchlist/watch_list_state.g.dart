// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_list_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WatchListStateCWProxy {
  WatchListState movies(List<WatchlistMovie> movies);

  WatchListState isLoading(bool isLoading);

  WatchListState hasError(bool hasError);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WatchListState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WatchListState(...).copyWith(id: 12, name: "My name")
  /// ````
  WatchListState call({
    List<WatchlistMovie>? movies,
    bool? isLoading,
    bool? hasError,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWatchListState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWatchListState.copyWith.fieldName(...)`
class _$WatchListStateCWProxyImpl implements _$WatchListStateCWProxy {
  const _$WatchListStateCWProxyImpl(this._value);

  final WatchListState _value;

  @override
  WatchListState movies(List<WatchlistMovie> movies) => this(movies: movies);

  @override
  WatchListState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  WatchListState hasError(bool hasError) => this(hasError: hasError);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WatchListState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WatchListState(...).copyWith(id: 12, name: "My name")
  /// ````
  WatchListState call({
    Object? movies = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? hasError = const $CopyWithPlaceholder(),
  }) {
    return WatchListState(
      movies: movies == const $CopyWithPlaceholder() || movies == null
          ? _value.movies
          // ignore: cast_nullable_to_non_nullable
          : movies as List<WatchlistMovie>,
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      hasError: hasError == const $CopyWithPlaceholder() || hasError == null
          ? _value.hasError
          // ignore: cast_nullable_to_non_nullable
          : hasError as bool,
    );
  }
}

extension $WatchListStateCopyWith on WatchListState {
  /// Returns a callable class that can be used as follows: `instanceOfWatchListState.copyWith(...)` or like so:`instanceOfWatchListState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WatchListStateCWProxy get copyWith => _$WatchListStateCWProxyImpl(this);
}
