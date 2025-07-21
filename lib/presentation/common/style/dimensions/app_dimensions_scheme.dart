// coverage:ignore-file

import 'package:copy_with_extension/copy_with_extension.dart';
part 'app_dimensions_scheme.g.dart';

@CopyWith()
class AppDimensionScheme {
  final double screenMargin;
  final double movieDetailsTopPadding;
  final double heightRation;
  final double movierProviderSize;
  const AppDimensionScheme({
    required this.screenMargin,
    required this.movieDetailsTopPadding,
    required this.heightRation,
    required this.movierProviderSize,
  });
}
