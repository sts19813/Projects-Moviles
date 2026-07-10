enum ComponentPlatform { material, cupertino, adaptive }

enum ComponentLevel { basic, advanced }

class CatalogComponent {
  const CatalogComponent({
    required this.id,
    required this.name,
    required this.description,
    required this.categoryId,
    required this.tags,
    required this.platform,
    required this.level,
    this.sourceCode = '',
  });

  final String id;
  final String name;
  final String description;
  final String categoryId;
  final List<String> tags;
  final ComponentPlatform platform;
  final ComponentLevel level;
  final String sourceCode;

  bool matches(String query, {String categoryName = ''}) {
    final normalized = query.trim().toLowerCase();
    if (normalized.isEmpty) {
      return true;
    }
    return name.toLowerCase().contains(normalized) ||
        description.toLowerCase().contains(normalized) ||
        categoryName.toLowerCase().contains(normalized) ||
        tags.any((tag) => tag.toLowerCase().contains(normalized));
  }
}
