import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui_catalog/core/persistence/app_preferences_repository.dart';

class RecentComponentsController extends Notifier<List<String>> {
  static const _limit = 6;

  @override
  List<String> build() {
    return List<String>.unmodifiable(
      ref.watch(persistedAppStateProvider).recentComponentIds,
    );
  }

  void _persist() {
    unawaited(
      ref.read(appPreferencesRepositoryProvider).saveRecentComponents(state),
    );
  }

  void visit(String componentId) {
    final recent = <String>[
      componentId,
      ...state.where((id) => id != componentId),
    ].take(_limit).toList(growable: false);
    state = List<String>.unmodifiable(recent);
    _persist();
  }

  void clear({bool persist = true}) {
    state = const <String>[];
    if (persist) {
      _persist();
    }
  }
}

final recentComponentsProvider =
    NotifierProvider<RecentComponentsController, List<String>>(
      RecentComponentsController.new,
    );
