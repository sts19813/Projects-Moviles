import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_catalog/core/persistence/app_preferences_repository.dart';
import 'package:flutter_ui_catalog/core/persistence/persisted_app_state.dart';
import 'package:flutter_ui_catalog/core/persistence/preference_storage.dart';
import 'package:flutter_ui_catalog/features/favorites/presentation/controllers/favorites_controller.dart';
import 'package:flutter_ui_catalog/features/recent/presentation/controllers/recent_components_controller.dart';
import 'package:flutter_ui_catalog/features/search/presentation/controllers/catalog_search_controller.dart';
import 'package:flutter_ui_catalog/features/settings/display_preferences_controller.dart';
import 'package:flutter_ui_catalog/features/settings/theme_controller.dart';

void main() {
  test('repository saves, loads and clears only catalog preferences', () async {
    final storage = MemoryPreferenceStorage(<String, Object>{
      'unrelated.preference': 'preserve-me',
    });
    final repository = AppPreferencesRepository(storage);

    await repository.saveTheme('dark');
    await repository.saveDisplayPreferences(
      useMaterial3: false,
      density: 'compact',
      showCupertinoExamples: false,
      showCodeAutomatically: true,
    );
    await repository.saveFavorites(<String>['filled-button']);
    await repository.saveSearchHistory(<String>['botón']);
    await repository.saveRecentComponents(<String>['text-field']);

    final state = await repository.load();
    expect(state.theme, 'dark');
    expect(state.useMaterial3, isFalse);
    expect(state.density, 'compact');
    expect(state.showCupertinoExamples, isFalse);
    expect(state.showCodeAutomatically, isTrue);
    expect(state.favoriteIds, <String>['filled-button']);
    expect(state.searchHistory, <String>['botón']);
    expect(state.recentComponentIds, <String>['text-field']);

    await repository.clear();

    expect(storage.values['unrelated.preference'], 'preserve-me');
    final reset = await repository.load();
    expect(reset.theme, 'system');
    expect(reset.favoriteIds, isEmpty);
  });

  test('controllers hydrate persisted state and write later changes', () async {
    final storage = MemoryPreferenceStorage();
    final repository = AppPreferencesRepository(storage);
    const initial = PersistedAppState(
      theme: 'dark',
      density: 'compact',
      favoriteIds: <String>['filled-button'],
      searchHistory: <String>['card'],
      recentComponentIds: <String>['text-field'],
    );
    final container = ProviderContainer(
      overrides: [
        appPreferencesRepositoryProvider.overrideWithValue(repository),
        persistedAppStateProvider.overrideWithValue(initial),
      ],
    );
    addTearDown(container.dispose);

    expect(container.read(themeControllerProvider), AppThemePreference.dark);
    expect(
      container.read(displayPreferencesProvider).density,
      AppDensity.compact,
    );
    expect(container.read(favoritesProvider), contains('filled-button'));
    expect(container.read(catalogSearchProvider).history, <String>['card']);
    expect(container.read(recentComponentsProvider), <String>['text-field']);

    container
        .read(themeControllerProvider.notifier)
        .setTheme(AppThemePreference.light);
    container.read(favoritesProvider.notifier).toggle('card');
    container.read(catalogSearchProvider.notifier).submit('slider');
    container.read(recentComponentsProvider.notifier).visit('card');
    await Future<void>.delayed(Duration.zero);

    final saved = await repository.load();
    expect(saved.theme, 'light');
    expect(saved.favoriteIds, containsAll(<String>['filled-button', 'card']));
    expect(saved.searchHistory.first, 'slider');
    expect(saved.recentComponentIds.first, 'card');
  });

  test('invalid persisted enum names fall back to safe defaults', () {
    final container = ProviderContainer(
      overrides: [
        persistedAppStateProvider.overrideWithValue(
          const PersistedAppState(theme: 'unknown', density: 'unknown'),
        ),
      ],
    );
    addTearDown(container.dispose);

    expect(container.read(themeControllerProvider), AppThemePreference.system);
    expect(
      container.read(displayPreferencesProvider).density,
      AppDensity.comfortable,
    );
  });
}
