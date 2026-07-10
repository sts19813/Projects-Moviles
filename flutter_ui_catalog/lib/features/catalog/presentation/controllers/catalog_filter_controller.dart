import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui_catalog/features/catalog/data/registries/catalog_categories.dart';
import 'package:flutter_ui_catalog/features/catalog/data/registries/catalog_registry.dart';
import 'package:flutter_ui_catalog/features/catalog/domain/models/catalog_category.dart';
import 'package:flutter_ui_catalog/features/catalog/domain/models/catalog_component.dart';
import 'package:flutter_ui_catalog/features/settings/display_preferences_controller.dart';

@immutable
class CatalogFilters {
  const CatalogFilters({
    this.platforms = const <ComponentPlatform>{},
    this.level,
  });

  final Set<ComponentPlatform> platforms;
  final ComponentLevel? level;

  bool get isEmpty => platforms.isEmpty && level == null;

  CatalogFilters copyWith({
    Set<ComponentPlatform>? platforms,
    ComponentLevel? level,
    bool clearLevel = false,
  }) {
    return CatalogFilters(
      platforms: platforms ?? this.platforms,
      level: clearLevel ? null : level ?? this.level,
    );
  }
}

class CatalogFilterController extends Notifier<CatalogFilters> {
  @override
  CatalogFilters build() => const CatalogFilters();

  void togglePlatform(ComponentPlatform platform) {
    final platforms = Set<ComponentPlatform>.of(state.platforms);
    platforms.contains(platform)
        ? platforms.remove(platform)
        : platforms.add(platform);
    state = state.copyWith(
      platforms: Set<ComponentPlatform>.unmodifiable(platforms),
    );
  }

  void setLevel(ComponentLevel? level) {
    state = state.copyWith(level: level, clearLevel: level == null);
  }

  void clear() {
    state = const CatalogFilters();
  }
}

List<CatalogComponent> filterCatalogComponents({
  required List<CatalogComponent> components,
  required CatalogFilters filters,
  required bool showCupertinoExamples,
}) {
  return components
      .where((component) {
        if (!showCupertinoExamples &&
            component.platform == ComponentPlatform.cupertino) {
          return false;
        }
        if (filters.platforms.isNotEmpty &&
            !filters.platforms.contains(component.platform)) {
          return false;
        }
        return filters.level == null || component.level == filters.level;
      })
      .toList(growable: false);
}

final catalogComponentsProvider = Provider<List<CatalogComponent>>((ref) {
  return catalogRegistry;
});

final catalogCategoriesProvider = Provider<List<CatalogCategory>>((ref) {
  return catalogCategories;
});

final catalogFiltersProvider =
    NotifierProvider<CatalogFilterController, CatalogFilters>(
      CatalogFilterController.new,
    );

final filteredCatalogComponentsProvider = Provider<List<CatalogComponent>>((
  ref,
) {
  return filterCatalogComponents(
    components: ref.watch(catalogComponentsProvider),
    filters: ref.watch(catalogFiltersProvider),
    showCupertinoExamples: ref
        .watch(displayPreferencesProvider)
        .showCupertinoExamples,
  );
});
