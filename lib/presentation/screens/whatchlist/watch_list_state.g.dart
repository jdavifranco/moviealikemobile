// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_list_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WatchListStateCWProxy {
  WatchListState movies(List<WatchlistMovie> movies);

  WatchListState isLoading(bool isLoading);

  WatchListState hasError(bool hasError);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `WatchListState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// WatchListState(...).copyWith(id: 12, name: "My name")
  /// ```
  WatchListState call({
    List<WatchlistMovie> movies,
    bool isLoading,
    bool hasError,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfWatchListState.copyWith(...)` or call `instanceOfWatchListState.copyWith.fieldName(value)` for a single field.
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

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `WatchListState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// WatchListState(...).copyWith(id: 12, name: "My name")
  /// ```
  WatchListState call({
    Object? movies = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? hasError = const $CopyWithPlaceholder(),
  }) {
    return WatchListState(
      movies: movies == const $CopyWithPlaceholder()
          ? _value.movies
          // ignore: cast_nullable_to_non_nullable
          : movies as List<WatchlistMovie>,
      isLoading: isLoading == const $CopyWithPlaceholder()
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      hasError: hasError == const $CopyWithPlaceholder()
          ? _value.hasError
          // ignore: cast_nullable_to_non_nullable
          : hasError as bool,
    );
  }
}

extension $WatchListStateCopyWith on WatchListState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfWatchListState.copyWith(...)` or `instanceOfWatchListState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WatchListStateCWProxy get copyWith => _$WatchListStateCWProxyImpl(this);
}
