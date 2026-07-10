import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/app/theme/app_colors.dart';
import 'package:flutter_ui_catalog/app/theme/app_radius.dart';
import 'package:flutter_ui_catalog/app/theme/app_typography.dart';
import 'package:flutter_ui_catalog/features/settings/display_preferences_controller.dart';

abstract final class AppTheme {
  static ThemeData light(DisplayPreferences preferences) {
    return _build(Brightness.light, preferences);
  }

  static ThemeData dark(DisplayPreferences preferences) {
    return _build(Brightness.dark, preferences);
  }

  static ThemeData _build(
    Brightness brightness,
    DisplayPreferences preferences,
  ) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.seed,
      brightness: brightness,
    );
    final base = ThemeData(
      useMaterial3: preferences.useMaterial3,
      visualDensity: preferences.density == AppDensity.compact
          ? VisualDensity.compact
          : VisualDensity.standard,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: brightness == Brightness.light
          ? AppColors.lightBackground
          : AppColors.darkBackground,
    );

    return base.copyWith(
      textTheme: AppTypography.textTheme(base.textTheme),
      cardTheme: const CardThemeData(
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.lg)),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppRadius.md)),
        ),
      ),
    );
  }
}
