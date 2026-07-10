import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui_catalog/app/theme/app_spacing.dart';
import 'package:flutter_ui_catalog/core/persistence/app_preferences_repository.dart';
import 'package:flutter_ui_catalog/features/favorites/presentation/controllers/favorites_controller.dart';
import 'package:flutter_ui_catalog/features/recent/presentation/controllers/recent_components_controller.dart';
import 'package:flutter_ui_catalog/features/search/presentation/controllers/catalog_search_controller.dart';
import 'package:flutter_ui_catalog/features/settings/display_preferences_controller.dart';
import 'package:flutter_ui_catalog/features/settings/theme_controller.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  Future<void> _reset(BuildContext context, WidgetRef ref) async {
    try {
      await ref.read(appPreferencesRepositoryProvider).clear();
      ref
          .read(themeControllerProvider.notifier)
          .setTheme(AppThemePreference.system, persist: false);
      ref.read(displayPreferencesProvider.notifier).reset(persist: false);
      ref.read(favoritesProvider.notifier).clear(persist: false);
      ref.read(catalogSearchProvider.notifier).clearHistory(persist: false);
      ref.read(recentComponentsProvider.notifier).clear(persist: false);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Preferencias restablecidas')),
        );
      }
    } on Object {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No fue posible restablecer las preferencias'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themePreference = ref.watch(themeControllerProvider);
    final preferences = ref.watch(displayPreferencesProvider);
    final controller = ref.read(displayPreferencesProvider.notifier);

    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar.large(title: Text('Configuración')),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.md,
            0,
            AppSpacing.md,
            AppSpacing.xxl,
          ),
          sliver: SliverList.list(
            children: <Widget>[
              Text('Apariencia', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: AppSpacing.md),
              Text('Tema', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: AppSpacing.sm),
              SegmentedButton<AppThemePreference>(
                segments: const <ButtonSegment<AppThemePreference>>[
                  ButtonSegment<AppThemePreference>(
                    value: AppThemePreference.system,
                    icon: Icon(Icons.brightness_auto_outlined),
                    label: Text('Sistema'),
                  ),
                  ButtonSegment<AppThemePreference>(
                    value: AppThemePreference.light,
                    icon: Icon(Icons.light_mode_outlined),
                    label: Text('Claro'),
                  ),
                  ButtonSegment<AppThemePreference>(
                    value: AppThemePreference.dark,
                    icon: Icon(Icons.dark_mode_outlined),
                    label: Text('Oscuro'),
                  ),
                ],
                selected: <AppThemePreference>{themePreference},
                onSelectionChanged: (selection) {
                  ref
                      .read(themeControllerProvider.notifier)
                      .setTheme(selection.first);
                },
              ),
              const SizedBox(height: AppSpacing.md),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Material 3'),
                subtitle: const Text('Usar los estilos modernos de Material.'),
                value: preferences.useMaterial3,
                onChanged: (value) => controller.setUseMaterial3(value: value),
              ),
              const Divider(),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Densidad visual',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: AppSpacing.sm),
              SegmentedButton<AppDensity>(
                segments: const <ButtonSegment<AppDensity>>[
                  ButtonSegment<AppDensity>(
                    value: AppDensity.comfortable,
                    icon: Icon(Icons.space_bar),
                    label: Text('Cómoda'),
                  ),
                  ButtonSegment<AppDensity>(
                    value: AppDensity.compact,
                    icon: Icon(Icons.density_small),
                    label: Text('Compacta'),
                  ),
                ],
                selected: <AppDensity>{preferences.density},
                onSelectionChanged: (selection) {
                  controller.setDensity(selection.first);
                },
              ),
              const SizedBox(height: AppSpacing.xl),
              Text(
                'Contenido del catálogo',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: AppSpacing.sm),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Mostrar ejemplos Cupertino'),
                subtitle: const Text(
                  'Incluye componentes con apariencia de iOS.',
                ),
                value: preferences.showCupertinoExamples,
                onChanged: (value) {
                  controller.setShowCupertinoExamples(value: value);
                },
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Mostrar código automáticamente'),
                subtitle: const Text(
                  'Abre el código al entrar a un componente.',
                ),
                value: preferences.showCodeAutomatically,
                onChanged: (value) {
                  controller.setShowCodeAutomatically(value: value);
                },
              ),
              const SizedBox(height: AppSpacing.xl),
              OutlinedButton.icon(
                onPressed: () async => _reset(context, ref),
                icon: const Icon(Icons.restart_alt),
                label: const Text('Restablecer preferencias'),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Las preferencias se guardan localmente en este dispositivo.',
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
