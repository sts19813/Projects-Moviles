import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui_catalog/app/router/app_router.dart';
import 'package:flutter_ui_catalog/app/theme/app_spacing.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/controllers/catalog_filter_controller.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/widgets/catalog_component_card.dart';
import 'package:flutter_ui_catalog/features/favorites/presentation/controllers/favorites_controller.dart';
import 'package:go_router/go_router.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteIds = ref.watch(favoritesProvider);
    final categories = ref.watch(catalogCategoriesProvider);
    final categoryNames = <String, String>{
      for (final category in categories) category.id: category.name,
    };
    final components = ref
        .watch(catalogComponentsProvider)
        .where((component) => favoriteIds.contains(component.id))
        .toList(growable: false);

    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar.large(title: Text('Favoritos')),
        if (components.isEmpty)
          const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.favorite_outline, size: 64),
                    SizedBox(height: AppSpacing.md),
                    Text('Aún no has marcado componentes como favoritos.'),
                  ],
                ),
              ),
            ),
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
                  isFavorite: true,
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
