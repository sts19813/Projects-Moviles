import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui_catalog/features/catalog/domain/models/catalog_category.dart';
import 'package:flutter_ui_catalog/features/catalog/domain/models/catalog_component.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/controllers/catalog_filter_controller.dart';

@immutable
class CatalogSearchState {
  const CatalogSearchState({this.query = '', this.history = const <String>[]});

  final String query;
  final List<String> history;

  CatalogSearchState copyWith({String? query, List<String>? history}) {
    return CatalogSearchState(
      query: query ?? this.query,
      history: history ?? this.history,
    );
  }
}

class CatalogSearchController extends Notifier<CatalogSearchState> {
  static const _historyLimit = 6;

  @override
  CatalogSearchState build() => const CatalogSearchState();

  void updateQuery(String query) {
    state = state.copyWith(query: query);
  }

  void submit([String? value]) {
    final query = (value ?? state.query).trim();
    if (query.isEmpty) {
      return;
    }
    final history = <String>[
      query,
      ...state.history.where(
        (item) => item.toLowerCase() != query.toLowerCase(),
      ),
    ].take(_historyLimit).toList(growable: false);
    state = state.copyWith(query: query, history: history);
  }

  void selectHistory(String query) {
    state = state.copyWith(query: query);
    submit(query);
  }

  void clearQuery() {
    state = state.copyWith(query: '');
  }

  void clearHistory() {
    state = state.copyWith(history: const <String>[]);
  }
}

List<CatalogComponent> searchCatalogComponents({
  required List<CatalogComponent> components,
  required List<CatalogCategory> categories,
  required String query,
}) {
  final categoryNames = <String, String>{
    for (final category in categories) category.id: category.name,
  };
  return components
      .where(
        (component) => component.matches(
          query,
          categoryName: categoryNames[component.categoryId] ?? '',
        ),
      )
      .toList(growable: false);
}

final catalogSearchProvider =
    NotifierProvider<CatalogSearchController, CatalogSearchState>(
      CatalogSearchController.new,
    );

final catalogSearchResultsProvider = Provider<List<CatalogComponent>>((ref) {
  return searchCatalogComponents(
    components: ref.watch(filteredCatalogComponentsProvider),
    categories: ref.watch(catalogCategoriesProvider),
    query: ref.watch(catalogSearchProvider).query,
  );
});
