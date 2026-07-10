import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui_catalog/app/router/app_router.dart';
import 'package:flutter_ui_catalog/app/theme/app_spacing.dart';
import 'package:flutter_ui_catalog/features/catalog/domain/models/catalog_category.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/controllers/catalog_filter_controller.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/widgets/catalog_component_card.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/widgets/catalog_filter_bar.dart';
import 'package:flutter_ui_catalog/features/favorites/presentation/controllers/favorites_controller.dart';
import 'package:go_router/go_router.dart';

class CatalogPage extends ConsumerWidget {
  const CatalogPage({this.categoryId, super.key});

  final String? categoryId;

  CatalogCategory? _selectedCategory(List<CatalogCategory> categories) {
    for (final category in categories) {
      if (category.id == categoryId) {
        return category;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(catalogCategoriesProvider);
    final selectedCategory = _selectedCategory(categories);
    final filters = ref.watch(catalogFiltersProvider);
    final favorites = ref.watch(favoritesProvider);
    final categoryNames = <String, String>{
      for (final category in categories) category.id: category.name,
    };
    final filtered = ref.watch(filteredCatalogComponentsProvider);
    final components = categoryId == null
        ? filtered
        : filtered
              .where((component) => component.categoryId == categoryId)
              .toList(growable: false);
    final filterController = ref.read(catalogFiltersProvider.notifier);

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar.large(
          title: Text(selectedCategory?.name ?? 'Catálogo'),
          actions: <Widget>[
            IconButton(
              tooltip: 'Buscar',
              onPressed: () => context.push(AppRoutes.search),
              icon: const Icon(Icons.search),
            ),
            const SizedBox(width: AppSpacing.sm),
          ],
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.md,
            0,
            AppSpacing.md,
            AppSpacing.md,
          ),
          sliver: SliverToBoxAdapter(
            child: CatalogFilterBar(
              categories: categories,
              selectedCategoryId: selectedCategory?.id,
              filters: filters,
              onCategorySelected: (id) {
                context.go(
                  id == null ? AppRoutes.catalog : AppRoutes.category(id),
                );
              },
              onPlatformToggled: filterController.togglePlatform,
              onLevelSelected: filterController.setLevel,
              onClear: filterController.clear,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          sliver: SliverToBoxAdapter(
            child: Text(
              '${components.length} componentes',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.sm)),
        if (components.isEmpty)
          const SliverFillRemaining(
            hasScrollBody: false,
            child: _EmptyCatalog(),
          )
        else
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              0,
              AppSpacing.md,
              AppSpacing.xxl,
            ),
            sliver: SliverList.separated(
              itemCount: components.length,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: AppSpacing.sm),
              itemBuilder: (context, index) {
                final component = components[index];
                return CatalogComponentCard(
                  component: component,
                  categoryName: categoryNames[component.categoryId] ?? '',
                  isFavorite: favorites.contains(component.id),
                  onFavorite: () {
                    ref.read(favoritesProvider.notifier).toggle(component.id);
                  },
                  onTap: () => context.push(
                    AppRoutes.component(component.categoryId, component.id),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}

class _EmptyCatalog extends StatelessWidget {
  const _EmptyCatalog();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.filter_alt_off, size: 56),
            SizedBox(height: AppSpacing.md),
            Text('No hay componentes que coincidan con estos filtros.'),
          ],
        ),
      ),
    );
  }
}
