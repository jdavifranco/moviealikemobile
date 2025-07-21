import 'package:flutter/material.dart';
import 'package:moviealike/presentation/common/style/dimensions/app_dimensions_scheme.dart';
import 'package:moviealike/presentation/common/style/dimensions/app_dimensions_scheme_large_screen.dart';
import 'package:moviealike/presentation/common/style/dimensions/app_dimenstions_scheme_phone.dart';
import 'package:moviealike/presentation/common/style/typography/app_typography_large.dart';
import 'package:moviealike/presentation/common/style/typography/app_typography_phone.dart';
import 'package:moviealike/presentation/common/style/typography/app_typography_scheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moviealike/presentation/widgets/device_type_builder.dart';

extension AppLocalizationsExt on BuildContext {
  AppLocalizations get text => AppLocalizations.of(this)!;
}

extension TypographySchemeExt on BuildContext {
  AppTypographyScheme get typography {
    switch (getDeviceType(this)) {
      case DeviceType.phone:
        return phoneTypographyScheme;
      case DeviceType.large:
        return largeTypographyScheme;
      case DeviceType.smallPhone:
        return phoneTypographyScheme;
    }
  }
}

extension AppDimensionSchemeExt on BuildContext {
  AppDimensionScheme get dimensionScheme {
    switch (getDeviceType(this)) {
      case DeviceType.phone:
        return appDimensionSchemePhone;
      case DeviceType.large:
        return appDimensionSchemeLargeScreen;
      case DeviceType.smallPhone:
        return appDimensionSchemePhone;
    }
  }
}

extension IsTabletExt on BuildContext {
  bool get isLargeScreen => getDeviceType(this) == DeviceType.large;
}

mixin OnContextReady<T extends StatefulWidget> on State<T> {
  bool isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isInitialized) {
      isInitialized = true;
      onContextReady(context);
    }
  }

  void onContextReady(BuildContext context);
}
