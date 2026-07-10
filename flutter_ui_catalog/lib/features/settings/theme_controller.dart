import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AppThemePreference { system, light, dark }

extension AppThemePreferenceX on AppThemePreference {
  ThemeMode get themeMode => switch (this) {
    AppThemePreference.system => ThemeMode.system,
    AppThemePreference.light => ThemeMode.light,
    AppThemePreference.dark => ThemeMode.dark,
  };
}

class ThemeController extends Notifier<AppThemePreference> {
  @override
  AppThemePreference build() => AppThemePreference.system;

  void setTheme(AppThemePreference preference) {
    state = preference;
  }
}

final themeControllerProvider =
    NotifierProvider<ThemeController, AppThemePreference>(ThemeController.new);
