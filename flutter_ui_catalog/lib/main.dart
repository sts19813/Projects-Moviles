import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui_catalog/app/app.dart';
import 'package:flutter_ui_catalog/core/persistence/app_preferences_repository.dart';
import 'package:flutter_ui_catalog/core/persistence/persisted_app_state.dart';
import 'package:flutter_ui_catalog/core/persistence/preference_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final repository = AppPreferencesRepository(SharedPreferencesStorage());
  var initialState = const PersistedAppState();
  try {
    initialState = await repository.load();
  } on Object catch (error, stackTrace) {
    FlutterError.reportError(
      FlutterErrorDetails(
        exception: error,
        stack: stackTrace,
        library: 'flutter_ui_catalog bootstrap',
        context: ErrorDescription('loading local preferences'),
      ),
    );
  }
  runApp(
    ProviderScope(
      overrides: [
        appPreferencesRepositoryProvider.overrideWithValue(repository),
        persistedAppStateProvider.overrideWithValue(initialState),
      ],
      child: const FlutterUiCatalogApp(),
    ),
  );
}
