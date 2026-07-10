import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui_catalog/core/persistence/app_preferences_repository.dart';

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
  AppThemePreference build() {
    final name = ref.watch(persistedAppStateProvider).theme;
    return AppThemePreference.values.firstWhere(
      (preference) => preference.name == name,
      orElse: () => AppThemePreference.system,
    );
  }

  void setTheme(AppThemePreference preference, {bool persist = true}) {
    state = preference;
    if (persist) {
      unawaited(
        ref.read(appPreferencesRepositoryProvider).saveTheme(preference.name),
      );
    }
  }
}

final themeControllerProvider =
    NotifierProvider<ThemeController, AppThemePreference>(ThemeController.new);
