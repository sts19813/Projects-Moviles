import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_catalog/features/catalog/data/registries/catalog_categories.dart';
import 'package:flutter_ui_catalog/features/catalog/data/registries/catalog_registry.dart';
import 'package:flutter_ui_catalog/features/search/presentation/controllers/catalog_search_controller.dart';

void main() {
  test('searches by component name, category, description and tags', () {
    final byName = searchCatalogComponents(
      components: catalogRegistry,
      categories: catalogCategories,
      query: 'CupertinoButton',
    );
    final byCategory = searchCatalogComponents(
      components: catalogRegistry,
      categories: catalogCategories,
      query: 'Navegación',
    );
    final byDescription = searchCatalogComponents(
      components: catalogRegistry,
      categories: catalogCategories,
      query: 'validación integrada',
    );
    final byTag = searchCatalogComponents(
      components: catalogRegistry,
      categories: catalogCategories,
      query: 'calendario',
    );

    expect(byName.single.id, 'cupertino-button');
    expect(byCategory, hasLength(6));
    expect(byDescription.single.id, 'text-form-field');
    expect(byTag.single.id, 'date-picker');
  });

  test('search history removes duplicates and keeps six entries', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final controller = container.read(catalogSearchProvider.notifier);

    for (final query in <String>[
      'uno',
      'dos',
      'tres',
      'cuatro',
      'cinco',
      'seis',
      'siete',
    ]) {
      controller.submit(query);
    }
    controller.submit('TRES');

    final history = container.read(catalogSearchProvider).history;
    expect(history, hasLength(6));
    expect(history.first, 'TRES');
    expect(
      history.where((query) => query.toLowerCase() == 'tres'),
      hasLength(1),
    );
  });
}
