import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_catalog/features/catalog/data/registries/catalog_registry.dart';
import 'package:flutter_ui_catalog/features/catalog/domain/models/catalog_component.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/controllers/catalog_filter_controller.dart';

void main() {
  test('registry contains 40 components with unique identifiers', () {
    expect(catalogRegistry, hasLength(40));
    expect(
      catalogRegistry.map((component) => component.id).toSet(),
      hasLength(40),
    );
  });

  test('filters components by platform and level', () {
    final results = filterCatalogComponents(
      components: catalogRegistry,
      filters: const CatalogFilters(
        platforms: <ComponentPlatform>{ComponentPlatform.cupertino},
        level: ComponentLevel.basic,
      ),
      showCupertinoExamples: true,
    );

    expect(results, hasLength(3));
    expect(
      results.every(
        (component) =>
            component.platform == ComponentPlatform.cupertino &&
            component.level == ComponentLevel.basic,
      ),
      isTrue,
    );
  });

  test('respects the preference that hides Cupertino examples', () {
    final results = filterCatalogComponents(
      components: catalogRegistry,
      filters: const CatalogFilters(),
      showCupertinoExamples: false,
    );

    expect(
      results.any(
        (component) => component.platform == ComponentPlatform.cupertino,
      ),
      isFalse,
    );
  });
}
