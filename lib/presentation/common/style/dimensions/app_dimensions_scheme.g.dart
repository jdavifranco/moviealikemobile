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

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppDimensionScheme(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppDimensionScheme(...).copyWith(id: 12, name: "My name")
  /// ````
  AppDimensionScheme call({
    double? screenMargin,
    double? movieDetailsTopPadding,
    double? heightRation,
    double? movierProviderSize,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAppDimensionScheme.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAppDimensionScheme.copyWith.fieldName(...)`
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

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppDimensionScheme(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppDimensionScheme(...).copyWith(id: 12, name: "My name")
  /// ````
  AppDimensionScheme call({
    Object? screenMargin = const $CopyWithPlaceholder(),
    Object? movieDetailsTopPadding = const $CopyWithPlaceholder(),
    Object? heightRation = const $CopyWithPlaceholder(),
    Object? movierProviderSize = const $CopyWithPlaceholder(),
  }) {
    return AppDimensionScheme(
      screenMargin:
          screenMargin == const $CopyWithPlaceholder() || screenMargin == null
              ? _value.screenMargin
              // ignore: cast_nullable_to_non_nullable
              : screenMargin as double,
      movieDetailsTopPadding:
          movieDetailsTopPadding == const $CopyWithPlaceholder() ||
                  movieDetailsTopPadding == null
              ? _value.movieDetailsTopPadding
              // ignore: cast_nullable_to_non_nullable
              : movieDetailsTopPadding as double,
      heightRation:
          heightRation == const $CopyWithPlaceholder() || heightRation == null
              ? _value.heightRation
              // ignore: cast_nullable_to_non_nullable
              : heightRation as double,
      movierProviderSize: movierProviderSize == const $CopyWithPlaceholder() ||
              movierProviderSize == null
          ? _value.movierProviderSize
          // ignore: cast_nullable_to_non_nullable
          : movierProviderSize as double,
    );
  }
}

extension $AppDimensionSchemeCopyWith on AppDimensionScheme {
  /// Returns a callable class that can be used as follows: `instanceOfAppDimensionScheme.copyWith(...)` or like so:`instanceOfAppDimensionScheme.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AppDimensionSchemeCWProxy get copyWith =>
      _$AppDimensionSchemeCWProxyImpl(this);
}
