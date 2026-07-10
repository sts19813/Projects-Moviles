import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/app/theme/app_spacing.dart';

class HomeCategory {
  const HomeCategory(
    this.id,
    this.name,
    this.description,
    this.icon,
    this.count,
  );

  final String id;
  final String name;
  final String description;
  final IconData icon;
  final int count;
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({required this.category, required this.onTap, super.key});

  final HomeCategory category;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card.outlined(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(category.icon, color: colors.primary, size: 30),
              const Spacer(),
              Text(
                category.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                category.description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                '${category.count} ejemplos',
                style: Theme.of(
                  context,
                ).textTheme.labelMedium?.copyWith(color: colors.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
