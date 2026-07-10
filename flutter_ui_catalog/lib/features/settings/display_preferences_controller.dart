import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  DisplayPreferences build() => const DisplayPreferences();

  void setUseMaterial3({required bool value}) {
    state = state.copyWith(useMaterial3: value);
  }

  void setDensity(AppDensity value) {
    state = state.copyWith(density: value);
  }

  void setShowCupertinoExamples({required bool value}) {
    state = state.copyWith(showCupertinoExamples: value);
  }

  void setShowCodeAutomatically({required bool value}) {
    state = state.copyWith(showCodeAutomatically: value);
  }

  void reset() {
    state = const DisplayPreferences();
  }
}

final displayPreferencesProvider =
    NotifierProvider<DisplayPreferencesController, DisplayPreferences>(
      DisplayPreferencesController.new,
    );
