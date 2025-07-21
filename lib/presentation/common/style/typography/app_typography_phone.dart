import 'package:flutter/material.dart';
import 'package:moviealike/presentation/common/style/app_colors.dart';
import 'package:moviealike/presentation/common/style/typography/app_typography_scheme.dart';
import 'package:moviealike/presentation/common/style/font_families.dart';

AppTypographyScheme phoneTypographyScheme = const AppTypographyScheme(
  heading1: TextStyle(
    color: AppColors.textPrimary,
    fontWeight: FontWeight.bold,
    fontFamily: FontFamilies.montserrat,
    fontSize: 28.0,
  ),
  heading2: TextStyle(
    color: AppColors.textPrimary,
    fontWeight: FontWeight.normal,
    fontFamily: FontFamilies.montserrat,
    fontSize: 24.0,
  ),
  heading3: TextStyle(
    color: AppColors.textPrimary,
    fontWeight: FontWeight.normal,
    fontFamily: FontFamilies.montserrat,
    fontSize: 18.0,
  ),
  heading4: TextStyle(
    color: AppColors.textPrimary,
    fontWeight: FontWeight.normal,
    fontFamily: FontFamilies.montserrat,
    fontSize: 16.0,
  ),
  heading5: TextStyle(
    color: AppColors.textPrimary,
    fontWeight: FontWeight.bold,
    fontFamily: FontFamilies.montserrat,
    fontSize: 14.0,
  ),
  heading6: TextStyle(
    color: AppColors.textPrimary,
    fontWeight: FontWeight.bold,
    fontFamily: FontFamilies.montserrat,
    fontSize: 12.0,
  ),

  /// Body
  heading7: TextStyle(
    color: AppColors.textSecondary,
    fontWeight: FontWeight.normal,
    fontSize: 10.0,
  ),
  body2: TextStyle(
    color: AppColors.textSecondary,
    fontWeight: FontWeight.bold,
    fontSize: 14.0,
  ),
  body3: TextStyle(
    color: AppColors.textSecondary,
    fontWeight: FontWeight.normal,
    fontSize: 14.0,
  ),
);
