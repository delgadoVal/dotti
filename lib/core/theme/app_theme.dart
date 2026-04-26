import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

abstract final class AppTheme {
  static ThemeData get light => ThemeData(
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.primarySoft,
      tertiary: AppColors.accent,
      surface: AppColors.surface,
      onPrimary: AppColors.textOnPrimary,
      onSurface: AppColors.onSurface,
    ),
    scaffoldBackgroundColor: AppColors.background,

    textTheme: TextTheme(
      titleLarge: AppTypography.heading1,
      titleMedium: AppTypography.subHeading,
      bodyMedium: AppTypography.body,
      labelLarge: AppTypography.button,
    ),

    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primary,
    ),

    splashFactory: NoSplash.splashFactory,
    highlightColor: Colors.transparent,
  );
}
