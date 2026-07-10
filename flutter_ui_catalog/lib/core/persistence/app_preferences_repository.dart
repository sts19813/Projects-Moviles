import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui_catalog/core/persistence/persisted_app_state.dart';
import 'package:flutter_ui_catalog/core/persistence/preference_storage.dart';

abstract final class PreferenceKeys {
  static const theme = 'settings.theme';
  static const useMaterial3 = 'settings.use_material_3';
  static const density = 'settings.density';
  static const showCupertino = 'settings.show_cupertino';
  static const showCode = 'settings.show_code';
  static const favorites = 'catalog.favorites';
  static const searchHistory = 'search.history';
  static const recentComponents = 'catalog.recent';

  static const all = <String>{
    theme,
    useMaterial3,
    density,
    showCupertino,
    showCode,
    favorites,
    searchHistory,
    recentComponents,
  };
}

class AppPreferencesRepository {
  AppPreferencesRepository(this._storage);

  final PreferenceStorage _storage;

  Future<void> _write(
    Future<void> Function() operation,
    String operationName,
  ) async {
    try {
      await operation();
    } on Object catch (error, stackTrace) {
      FlutterError.reportError(
        FlutterErrorDetails(
          exception: error,
          stack: stackTrace,
          library: 'flutter_ui_catalog persistence',
          context: ErrorDescription(operationName),
        ),
      );
    }
  }

  Future<PersistedAppState> load() async {
    return PersistedAppState(
      theme: await _storage.getString(PreferenceKeys.theme) ?? 'system',
      useMaterial3: await _storage.getBool(PreferenceKeys.useMaterial3) ?? true,
      density:
          await _storage.getString(PreferenceKeys.density) ?? 'comfortable',
      showCupertinoExamples:
          await _storage.getBool(PreferenceKeys.showCupertino) ?? true,
      showCodeAutomatically:
          await _storage.getBool(PreferenceKeys.showCode) ?? false,
      favoriteIds:
          await _storage.getStringList(PreferenceKeys.favorites) ??
          const <String>[],
      searchHistory:
          await _storage.getStringList(PreferenceKeys.searchHistory) ??
          const <String>[],
      recentComponentIds:
          await _storage.getStringList(PreferenceKeys.recentComponents) ??
          const <String>[],
    );
  }

  Future<void> saveTheme(String value) {
    return _write(
      () => _storage.setString(PreferenceKeys.theme, value),
      'saving theme preference',
    );
  }

  Future<void> saveDisplayPreferences({
    required bool useMaterial3,
    required String density,
    required bool showCupertinoExamples,
    required bool showCodeAutomatically,
  }) async {
    await _write(
      () => Future.wait<void>(<Future<void>>[
        _storage.setBool(PreferenceKeys.useMaterial3, value: useMaterial3),
        _storage.setString(PreferenceKeys.density, density),
        _storage.setBool(
          PreferenceKeys.showCupertino,
          value: showCupertinoExamples,
        ),
        _storage.setBool(PreferenceKeys.showCode, value: showCodeAutomatically),
      ]),
      'saving display preferences',
    );
  }

  Future<void> saveFavorites(Iterable<String> values) {
    return _write(
      () => _storage.setStringList(
        PreferenceKeys.favorites,
        values.toList(growable: false),
      ),
      'saving favorites',
    );
  }

  Future<void> saveSearchHistory(List<String> values) {
    return _write(
      () => _storage.setStringList(PreferenceKeys.searchHistory, values),
      'saving search history',
    );
  }

  Future<void> saveRecentComponents(List<String> values) {
    return _write(
      () => _storage.setStringList(PreferenceKeys.recentComponents, values),
      'saving recent components',
    );
  }

  Future<void> clear() => _storage.clear(PreferenceKeys.all);
}

final appPreferencesRepositoryProvider = Provider<AppPreferencesRepository>((
  ref,
) {
  return AppPreferencesRepository(MemoryPreferenceStorage());
});

final persistedAppStateProvider = Provider<PersistedAppState>((ref) {
  return const PersistedAppState();
});
