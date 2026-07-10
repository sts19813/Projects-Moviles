import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui_catalog/core/persistence/app_preferences_repository.dart';

enum AppDensity { comfortable, compact }

@immutable
class DisplayPreferences {
  const DisplayPreferences({
    this.useMaterial3 = true,
    this.density = AppDensity.comfortable,
    this.showCupertinoExamples = true,
    this.showCodeAutomatically = false,
  });

  final bool useMaterial3;
  final AppDensity density;
  final bool showCupertinoExamples;
  final bool showCodeAutomatically;

  DisplayPreferences copyWith({
    bool? useMaterial3,
    AppDensity? density,
    bool? showCupertinoExamples,
    bool? showCodeAutomatically,
  }) {
    return DisplayPreferences(
      useMaterial3: useMaterial3 ?? this.useMaterial3,
      density: density ?? this.density,
      showCupertinoExamples:
          showCupertinoExamples ?? this.showCupertinoExamples,
      showCodeAutomatically:
          showCodeAutomatically ?? this.showCodeAutomatically,
    );
  }
}

class DisplayPreferencesController extends Notifier<DisplayPreferences> {
  @override
  DisplayPreferences build() {
    final persisted = ref.watch(persistedAppStateProvider);
    return DisplayPreferences(
      useMaterial3: persisted.useMaterial3,
      density: AppDensity.values.firstWhere(
        (density) => density.name == persisted.density,
        orElse: () => AppDensity.comfortable,
      ),
      showCupertinoExamples: persisted.showCupertinoExamples,
      showCodeAutomatically: persisted.showCodeAutomatically,
    );
  }

  void _persist() {
    unawaited(
      ref
          .read(appPreferencesRepositoryProvider)
          .saveDisplayPreferences(
            useMaterial3: state.useMaterial3,
            density: state.density.name,
            showCupertinoExamples: state.showCupertinoExamples,
            showCodeAutomatically: state.showCodeAutomatically,
          ),
    );
  }

  void setUseMaterial3({required bool value}) {
    state = state.copyWith(useMaterial3: value);
    _persist();
  }

  void setDensity(AppDensity value) {
    state = state.copyWith(density: value);
    _persist();
  }

  void setShowCupertinoExamples({required bool value}) {
    state = state.copyWith(showCupertinoExamples: value);
    _persist();
  }

  void setShowCodeAutomatically({required bool value}) {
    state = state.copyWith(showCodeAutomatically: value);
    _persist();
  }

  void reset({bool persist = true}) {
    state = const DisplayPreferences();
    if (persist) {
      _persist();
    }
  }
}

final displayPreferencesProvider =
    NotifierProvider<DisplayPreferencesController, DisplayPreferences>(
      DisplayPreferencesController.new,
    );
