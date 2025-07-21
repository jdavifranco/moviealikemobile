import 'package:flutter/material.dart';

class AppTypographyScheme extends ThemeExtension<AppTypographyScheme> {
  static AppTypographyScheme of(BuildContext context) =>
      Theme.of(context).extension<AppTypographyScheme>()!;

  final TextStyle heading1;
  final TextStyle heading2;
  final TextStyle heading3;

  final TextStyle heading4;
  final TextStyle heading5;
  final TextStyle heading6;

  final TextStyle heading7;
  final TextStyle body2;
  final TextStyle body3;

  const AppTypographyScheme({
    required this.heading1,
    required this.heading2,
    required this.heading3,
    required this.heading4,
    required this.heading5,
    required this.heading6,
    required this.heading7,
    required this.body2,
    required this.body3,
  });

  @override
  ThemeExtension<AppTypographyScheme> copyWith() => this;

  @override
  ThemeExtension<AppTypographyScheme> lerp(
          covariant ThemeExtension<AppTypographyScheme>? other, double t) =>
      this;
}
