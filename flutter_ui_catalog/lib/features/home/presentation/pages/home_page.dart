import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui_catalog/app/router/app_router.dart';
import 'package:flutter_ui_catalog/app/theme/app_radius.dart';
import 'package:flutter_ui_catalog/app/theme/app_spacing.dart';
import 'package:flutter_ui_catalog/features/catalog/domain/models/catalog_component.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/controllers/catalog_filter_controller.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/widgets/catalog_visuals.dart';
import 'package:flutter_ui_catalog/features/favorites/presentation/controllers/favorites_controller.dart';
import 'package:flutter_ui_catalog/features/home/presentation/widgets/category_card.dart';
import 'package:flutter_ui_catalog/features/home/presentation/widgets/home_section.dart';
import 'package:flutter_ui_catalog/features/recent/presentation/controllers/recent_components_controller.dart';
import 'package:flutter_ui_catalog/features/settings/theme_controller.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  void _toggleTheme(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    ref
        .read(themeControllerProvider.notifier)
        .setTheme(isDark ? AppThemePreference.light : AppThemePreference.dark);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final components = ref.watch(catalogComponentsProvider);
    final categories = ref.watch(catalogCategoriesProvider);
    final componentsById = <String, CatalogComponent>{
      for (final component in components) component.id: component,
    };
    final recentComponents = ref
        .watch(recentComponentsProvider)
        .map((id) => componentsById[id])
        .whereType<CatalogComponent>()
        .toList(growable: false);
    final favoriteComponents = ref
        .watch(favoritesProvider)
        .map((id) => componentsById[id])
        .whereType<CatalogComponent>()
        .take(4)
        .toList(growable: false);
    final homeCategories = categories
        .map((category) {
          final count = components
              .where((component) => component.categoryId == category.id)
              .length;
          return HomeCategory(
            category.id,
            category.name,
            category.description,
            iconForCategory(category.id),
            count,
          );
        })
        .toList(growable: false);

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar.large(
          title: const Text('Flutter UI Catalog'),
          actions: <Widget>[
            IconButton(
              tooltip: 'Cambiar tema',
              onPressed: () => _toggleTheme(context, ref),
              icon: const Icon(Icons.brightness_6_outlined),
            ),
            IconButton(
              tooltip: 'Abrir configuración',
              onPressed: () => context.go(AppRoutes.settings),
              icon: const Icon(Icons.settings_outlined),
            ),
            const SizedBox(width: AppSpacing.sm),
          ],
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.md,
            0,
            AppSpacing.md,
            AppSpacing.xxl,
          ),
          sliver: SliverList.list(
            children: <Widget>[
              Semantics(
                button: true,
                label: 'Buscar componentes',
                child: TextField(
                  readOnly: true,
                  onTap: () => context.push(AppRoutes.search),
                  decoration: const InputDecoration(
                    hintText: 'Buscar componentes, categorías o etiquetas',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              _CatalogSummary(
                componentCount: components.length,
                onExplore: () => context.go(AppRoutes.catalog),
              ),
              const SizedBox(height: AppSpacing.xl),
              HomeSection(
                title: 'Recientes',
                child: _ComponentChips(
                  components: recentComponents,
                  emptyText: 'Los componentes que visites aparecerán aquí.',
                  onTap: (component) => context.go(
                    AppRoutes.component(component.categoryId, component.id),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              HomeSection(
                title: 'Favoritos',
                actionLabel: 'Ver todos',
                onAction: () => context.go(AppRoutes.favorites),
                child: _ComponentChips(
                  components: favoriteComponents,
                  emptyText: 'Marca componentes para encontrarlos rápidamente.',
                  onTap: (component) => context.go(
                    AppRoutes.component(component.categoryId, component.id),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              Text('Categorías', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: AppSpacing.md),
              LayoutBuilder(
                builder: (context, constraints) {
                  final columns = switch (constraints.maxWidth) {
                    >= 1100 => 4,
                    >= 700 => 3,
                    >= 440 => 2,
                    _ => 1,
                  };
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                      crossAxisSpacing: AppSpacing.md,
                      mainAxisSpacing: AppSpacing.md,
                      mainAxisExtent: 164,
                    ),
                    itemCount: homeCategories.length,
                    itemBuilder: (context, index) {
                      final category = homeCategories[index];
                      return CategoryCard(
                        category: category,
                        onTap: () =>
                            context.go(AppRoutes.category(category.id)),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CatalogSummary extends StatelessWidget {
  const _CatalogSummary({
    required this.componentCount,
    required this.onExplore,
  });

  final int componentCount;
  final VoidCallback onExplore;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Material(
      color: colors.primaryContainer,
      borderRadius: BorderRadius.circular(AppRadius.lg),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final content = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '$componentCount componentes disponibles',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: AppSpacing.xs),
              const Text('Explora ejemplos Material, Cupertino y adaptativos.'),
            ],
          );
          final button = FilledButton.tonalIcon(
            onPressed: onExplore,
            icon: const Icon(Icons.arrow_forward),
            label: const Text('Explorar'),
          );

          return Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: constraints.maxWidth < 520
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      content,
                      const SizedBox(height: AppSpacing.md),
                      button,
                    ],
                  )
                : Row(
                    children: <Widget>[
                      Expanded(child: content),
                      const SizedBox(width: AppSpacing.md),
                      button,
                    ],
                  ),
          );
        },
      ),
    );
  }
}

class _ComponentChips extends StatelessWidget {
  const _ComponentChips({
    required this.components,
    required this.emptyText,
    required this.onTap,
  });

  final List<CatalogComponent> components;
  final String emptyText;
  final ValueChanged<CatalogComponent> onTap;

  @override
  Widget build(BuildContext context) {
    if (components.isEmpty) {
      return Row(
        children: <Widget>[
          const Icon(Icons.history),
          const SizedBox(width: AppSpacing.sm),
          Expanded(child: Text(emptyText)),
        ],
      );
    }
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: components
          .map(
            (component) => ActionChip(
              avatar: Icon(iconForCategory(component.categoryId), size: 18),
              label: Text(component.name),
              onPressed: () => onTap(component),
            ),
          )
          .toList(growable: false),
    );
  }
}
