import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui_catalog/core/persistence/app_preferences_repository.dart';

class FavoritesController extends Notifier<Set<String>> {
  @override
  Set<String> build() {
    return Set<String>.unmodifiable(
      ref.watch(persistedAppStateProvider).favoriteIds,
    );
  }

  void _persist() {
    unawaited(ref.read(appPreferencesRepositoryProvider).saveFavorites(state));
  }

  void toggle(String componentId) {
    final favorites = Set<String>.of(state);
    favorites.contains(componentId)
        ? favorites.remove(componentId)
        : favorites.add(componentId);
    state = Set<String>.unmodifiable(favorites);
    _persist();
  }

  void clear({bool persist = true}) {
    state = const <String>{};
    if (persist) {
      _persist();
    }
  }
}

final favoritesProvider = NotifierProvider<FavoritesController, Set<String>>(
  FavoritesController.new,
);
