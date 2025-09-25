// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_dimensions_scheme.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AppDimensionSchemeCWProxy {
  AppDimensionScheme screenMargin(double screenMargin);

  AppDimensionScheme movieDetailsTopPadding(double movieDetailsTopPadding);

  AppDimensionScheme heightRation(double heightRation);

  AppDimensionScheme movierProviderSize(double movierProviderSize);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AppDimensionScheme(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AppDimensionScheme(...).copyWith(id: 12, name: "My name")
  /// ```
  AppDimensionScheme call({
    double screenMargin,
    double movieDetailsTopPadding,
    double heightRation,
    double movierProviderSize,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAppDimensionScheme.copyWith(...)` or call `instanceOfAppDimensionScheme.copyWith.fieldName(value)` for a single field.
class _$AppDimensionSchemeCWProxyImpl implements _$AppDimensionSchemeCWProxy {
  const _$AppDimensionSchemeCWProxyImpl(this._value);

  final AppDimensionScheme _value;

  @override
  AppDimensionScheme screenMargin(double screenMargin) =>
      this(screenMargin: screenMargin);

  @override
  AppDimensionScheme movieDetailsTopPadding(double movieDetailsTopPadding) =>
      this(movieDetailsTopPadding: movieDetailsTopPadding);

  @override
  AppDimensionScheme heightRation(double heightRation) =>
      this(heightRation: heightRation);

  @override
  AppDimensionScheme movierProviderSize(double movierProviderSize) =>
      this(movierProviderSize: movierProviderSize);

  @override

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AppDimensionScheme(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AppDimensionScheme(...).copyWith(id: 12, name: "My name")
  /// ```
  AppDimensionScheme call({
    Object? screenMargin = const $CopyWithPlaceholder(),
    Object? movieDetailsTopPadding = const $CopyWithPlaceholder(),
    Object? heightRation = const $CopyWithPlaceholder(),
    Object? movierProviderSize = const $CopyWithPlaceholder(),
  }) {
    return AppDimensionScheme(
      screenMargin: screenMargin == const $CopyWithPlaceholder()
          ? _value.screenMargin
          // ignore: cast_nullable_to_non_nullable
          : screenMargin as double,
      movieDetailsTopPadding:
          movieDetailsTopPadding == const $CopyWithPlaceholder()
              ? _value.movieDetailsTopPadding
              // ignore: cast_nullable_to_non_nullable
              : movieDetailsTopPadding as double,
      heightRation: heightRation == const $CopyWithPlaceholder()
          ? _value.heightRation
          // ignore: cast_nullable_to_non_nullable
          : heightRation as double,
      movierProviderSize: movierProviderSize == const $CopyWithPlaceholder()
          ? _value.movierProviderSize
          // ignore: cast_nullable_to_non_nullable
          : movierProviderSize as double,
    );
  }
}

extension $AppDimensionSchemeCopyWith on AppDimensionScheme {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAppDimensionScheme.copyWith(...)` or `instanceOfAppDimensionScheme.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AppDimensionSchemeCWProxy get copyWith =>
      _$AppDimensionSchemeCWProxyImpl(this);
}
