import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui_catalog/app/router/app_router.dart';
import 'package:flutter_ui_catalog/app/theme/app_spacing.dart';
import 'package:flutter_ui_catalog/features/catalog/domain/models/catalog_component.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/controllers/catalog_filter_controller.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/widgets/catalog_component_card.dart';
import 'package:flutter_ui_catalog/features/favorites/presentation/controllers/favorites_controller.dart';
import 'package:flutter_ui_catalog/features/search/presentation/controllers/catalog_search_controller.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: ref.read(catalogSearchProvider).query,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _selectHistory(String query) {
    _controller.text = query;
    _controller.selection = TextSelection.collapsed(offset: query.length);
    ref.read(catalogSearchProvider.notifier).selectHistory(query);
  }

  @override
  Widget build(BuildContext context) {
    final search = ref.watch(catalogSearchProvider);
    final results = ref.watch(catalogSearchResultsProvider);
    final categories = ref.watch(catalogCategoriesProvider);
    final favorites = ref.watch(favoritesProvider);
    final categoryNames = <String, String>{
      for (final category in categories) category.id: category.name,
    };
    final searchController = ref.read(catalogSearchProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: TextField(
          controller: _controller,
          autofocus: true,
          textInputAction: TextInputAction.search,
          onChanged: searchController.updateQuery,
          onSubmitted: searchController.submit,
          decoration: InputDecoration(
            hintText: 'Buscar componentes',
            border: InputBorder.none,
            suffixIcon: search.query.isEmpty
                ? null
                : IconButton(
                    tooltip: 'Limpiar búsqueda',
                    onPressed: () {
                      _controller.clear();
                      searchController.clearQuery();
                    },
                    icon: const Icon(Icons.close),
                  ),
          ),
        ),
      ),
      body: search.query.trim().isEmpty
          ? _SearchHistory(
              history: search.history,
              onSelected: _selectHistory,
              onClear: searchController.clearHistory,
            )
          : _SearchResults(
              query: search.query,
              results: results,
              categoryNames: categoryNames,
              favorites: favorites,
              onFavorite: (id) {
                ref.read(favoritesProvider.notifier).toggle(id);
              },
              onComponentTap: (categoryId, componentId) {
                searchController.submit();
                context.go(AppRoutes.component(categoryId, componentId));
              },
            ),
    );
  }
}

class _SearchHistory extends StatelessWidget {
  const _SearchHistory({
    required this.history,
    required this.onSelected,
    required this.onClear,
  });

  final List<String> history;
  final ValueChanged<String> onSelected;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    if (history.isEmpty) {
      return const Center(child: Text('Escribe para buscar en el catálogo.'));
    }
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                'Búsquedas recientes',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            TextButton(onPressed: onClear, child: const Text('Borrar')),
          ],
        ),
        ...history.map(
          (query) => ListTile(
            leading: const Icon(Icons.history),
            title: Text(query),
            onTap: () => onSelected(query),
          ),
        ),
      ],
    );
  }
}

class _SearchResults extends StatelessWidget {
  const _SearchResults({
    required this.query,
    required this.results,
    required this.categoryNames,
    required this.favorites,
    required this.onFavorite,
    required this.onComponentTap,
  });

  final String query;
  final List<CatalogComponent> results;
  final Map<String, String> categoryNames;
  final Set<String> favorites;
  final ValueChanged<String> onFavorite;
  final void Function(String categoryId, String componentId) onComponentTap;

  @override
  Widget build(BuildContext context) {
    if (results.isEmpty) {
      return Center(child: Text('Sin resultados para “$query”.'));
    }
    return ListView.separated(
      padding: const EdgeInsets.all(AppSpacing.md),
      itemCount: results.length,
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppSpacing.sm),
      itemBuilder: (context, index) {
        final component = results[index];
        return CatalogComponentCard(
          component: component,
          categoryName: categoryNames[component.categoryId] ?? '',
          isFavorite: favorites.contains(component.id),
          onFavorite: () => onFavorite(component.id),
          onTap: () => onComponentTap(component.categoryId, component.id),
        );
      },
    );
  }
}
