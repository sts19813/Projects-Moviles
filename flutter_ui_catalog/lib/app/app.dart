import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui_catalog/app/router/app_router.dart';
import 'package:flutter_ui_catalog/app/theme/app_theme.dart';
import 'package:flutter_ui_catalog/features/settings/display_preferences_controller.dart';
import 'package:flutter_ui_catalog/features/settings/theme_controller.dart';

class FlutterUiCatalogApp extends ConsumerWidget {
  const FlutterUiCatalogApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final themePreference = ref.watch(themeControllerProvider);
    final displayPreferences = ref.watch(displayPreferencesProvider);

    return MaterialApp.router(
      title: 'Flutter UI Catalog',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(displayPreferences),
      darkTheme: AppTheme.dark(displayPreferences),
      themeMode: themePreference.themeMode,
      routerConfig: router,
    );
  }
}
