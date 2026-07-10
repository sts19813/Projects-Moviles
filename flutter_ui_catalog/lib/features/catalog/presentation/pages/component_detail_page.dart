import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui_catalog/app/theme/app_spacing.dart';
import 'package:flutter_ui_catalog/features/catalog/domain/models/catalog_component.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/controllers/catalog_filter_controller.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/controllers/demo_configuration_controller.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/widgets/catalog_visuals.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/widgets/component_demo_preview.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/widgets/component_properties_panel.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/widgets/component_variants.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/widgets/demo_source_code.dart';
import 'package:flutter_ui_catalog/features/favorites/presentation/controllers/favorites_controller.dart';
import 'package:flutter_ui_catalog/features/settings/display_preferences_controller.dart';
import 'package:flutter_ui_catalog/shared/code_viewer/code_viewer.dart';
import 'package:flutter_ui_catalog/shared/component_preview/component_demo_card.dart';

class ComponentDetailPage extends ConsumerWidget {
  const ComponentDetailPage({required this.componentId, super.key});

  final String componentId;

  CatalogComponent? _component(List<CatalogComponent> components) {
    for (final component in components) {
      if (component.id == componentId) {
        return component;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final component = _component(ref.watch(catalogComponentsProvider));
    if (component == null) {
      return const Scaffold(
        body: Center(child: Text('Componente no encontrado')),
      );
    }
    final configurations = ref.watch(demoConfigurationsProvider);
    final configuration =
        configurations[component.id] ?? const DemoConfiguration();
    final sourceCode = DemoSourceCode.forComponent(component, configuration);
    final isFavorite = ref.watch(favoritesProvider).contains(component.id);
    final showCodeAutomatically = ref
        .watch(displayPreferencesProvider)
        .showCodeAutomatically;
    final demoController = ref.read(demoConfigurationsProvider.notifier);

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text(component.name),
          actions: <Widget>[
            IconButton(
              tooltip: isFavorite
                  ? 'Quitar de favoritos'
                  : 'Agregar a favoritos',
              onPressed: () {
                ref.read(favoritesProvider.notifier).toggle(component.id);
              },
              icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_outline),
            ),
          ],
          bottom: const TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(text: 'Vista previa', icon: Icon(Icons.visibility_outlined)),
              Tab(text: 'Variantes', icon: Icon(Icons.view_carousel_outlined)),
              Tab(text: 'Código', icon: Icon(Icons.code)),
              Tab(text: 'Propiedades', icon: Icon(Icons.tune)),
              Tab(text: 'Notas', icon: Icon(Icons.notes)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView(
              padding: const EdgeInsets.all(AppSpacing.md),
              children: <Widget>[
                ComponentDemoCard(
                  title: component.name,
                  description: component.description,
                  preview: ComponentDemoPreview(
                    component: component,
                    configuration: configuration,
                  ),
                  sourceCode: sourceCode,
                  properties: <String>[
                    component.platform.label,
                    component.level.label,
                    ...component.tags,
                  ],
                  notes: <String>[
                    'Categoría: ${component.categoryId}',
                    'La vista respeta el tema y el tamaño de texto del sistema.',
                  ],
                  initiallyShowCode: showCodeAutomatically,
                ),
              ],
            ),
            ComponentVariants(component: component),
            ListView(
              padding: const EdgeInsets.all(AppSpacing.md),
              children: <Widget>[
                Text(
                  'Código fuente',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: AppSpacing.xs),
                const Text(
                  'El ejemplo se actualiza cuando modificas el playground.',
                ),
                const SizedBox(height: AppSpacing.md),
                CodeViewer(code: sourceCode, initiallyExpanded: true),
              ],
            ),
            ComponentPropertiesPanel(
              component: component,
              configuration: configuration,
              onChanged: (value) => demoController.update(component.id, value),
              onReset: () => demoController.reset(component.id),
            ),
            _ComponentNotes(component: component),
          ],
        ),
      ),
    );
  }
}

class _ComponentNotes extends StatelessWidget {
  const _ComponentNotes({required this.component});

  final CatalogComponent component;

  @override
  Widget build(BuildContext context) {
    final platformNote = switch (component.platform) {
      ComponentPlatform.material =>
        'Diseñado principalmente para Android con Material 3.',
      ComponentPlatform.cupertino =>
        'Utiliza convenciones visuales y de interacción propias de iOS.',
      ComponentPlatform.adaptive =>
        'Selecciona una presentación adecuada para Android o iOS.',
    };
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: <Widget>[
        Text(
          'Compatibilidad',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: AppSpacing.md),
        Card.outlined(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(component.platform.icon),
                title: Text(component.platform.label),
                subtitle: Text(platformNote),
              ),
              const ListTile(
                leading: Icon(Icons.android),
                title: Text('Android'),
                subtitle: Text(
                  'Compatible con el tema y la densidad seleccionados.',
                ),
              ),
              const ListTile(
                leading: Icon(Icons.apple),
                title: Text('iOS'),
                subtitle: Text(
                  'Compatible con orientación vertical y horizontal.',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        const Text(
          'Accesibilidad: conserva áreas táctiles mínimas, contraste del tema y escalado de texto del sistema.',
        ),
      ],
    );
  }
}
