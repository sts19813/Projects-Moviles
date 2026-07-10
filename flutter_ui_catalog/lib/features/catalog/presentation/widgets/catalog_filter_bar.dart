import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/app/theme/app_spacing.dart';
import 'package:flutter_ui_catalog/features/catalog/domain/models/catalog_category.dart';
import 'package:flutter_ui_catalog/features/catalog/domain/models/catalog_component.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/controllers/catalog_filter_controller.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/widgets/catalog_visuals.dart';

class CatalogFilterBar extends StatelessWidget {
  const CatalogFilterBar({
    required this.categories,
    required this.selectedCategoryId,
    required this.filters,
    required this.onCategorySelected,
    required this.onPlatformToggled,
    required this.onLevelSelected,
    required this.onClear,
    super.key,
  });

  final List<CatalogCategory> categories;
  final String? selectedCategoryId;
  final CatalogFilters filters;
  final ValueChanged<String?> onCategorySelected;
  final ValueChanged<ComponentPlatform> onPlatformToggled;
  final ValueChanged<ComponentLevel?> onLevelSelected;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 48,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: AppSpacing.sm),
                child: ChoiceChip(
                  label: const Text('Todos'),
                  selected: selectedCategoryId == null,
                  onSelected: (_) => onCategorySelected(null),
                ),
              ),
              ...categories.map(
                (category) => Padding(
                  padding: const EdgeInsets.only(right: AppSpacing.sm),
                  child: ChoiceChip(
                    label: Text(category.name),
                    selected: selectedCategoryId == category.id,
                    onSelected: (_) => onCategorySelected(category.id),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: <Widget>[
            ...ComponentPlatform.values.map(
              (platform) => FilterChip(
                avatar: Icon(platform.icon, size: 18),
                label: Text(platform.label),
                selected: filters.platforms.contains(platform),
                onSelected: (_) => onPlatformToggled(platform),
              ),
            ),
            ...ComponentLevel.values.map(
              (level) => FilterChip(
                label: Text(level.label),
                selected: filters.level == level,
                onSelected: (selected) {
                  onLevelSelected(selected ? level : null);
                },
              ),
            ),
            if (!filters.isEmpty)
              ActionChip(
                avatar: const Icon(Icons.filter_alt_off, size: 18),
                label: const Text('Limpiar filtros'),
                onPressed: onClear,
              ),
          ],
        ),
      ],
    );
  }
}
