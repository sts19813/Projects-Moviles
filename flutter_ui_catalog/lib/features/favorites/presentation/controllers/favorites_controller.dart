import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesController extends Notifier<Set<String>> {
  @override
  Set<String> build() => const <String>{};

  void toggle(String componentId) {
    final favorites = Set<String>.of(state);
    favorites.contains(componentId)
        ? favorites.remove(componentId)
        : favorites.add(componentId);
    state = Set<String>.unmodifiable(favorites);
  }
}

final favoritesProvider = NotifierProvider<FavoritesController, Set<String>>(
  FavoritesController.new,
);
