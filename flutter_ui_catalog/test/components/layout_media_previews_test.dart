import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_catalog/features/catalog/data/registries/catalog_registry.dart';
import 'package:flutter_ui_catalog/features/catalog/data/registries/layout_media_source_codes.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/controllers/demo_configuration_controller.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/widgets/component_demo_preview.dart';

const _newCategories = <String>{'layout', 'media'};

void main() {
  final components = catalogRegistry
      .where((component) => _newCategories.contains(component.categoryId))
      .toList(growable: false);

  test('all 26 layout and media components have source examples', () {
    expect(components, hasLength(26));
    expect(layoutMediaSourceCodes, hasLength(26));
    for (final component in components) {
      expect(
        layoutMediaSourceCodes.containsKey(component.id),
        isTrue,
        reason: '${component.id} does not have a source example',
      );
    }
  });

  for (final component in components) {
    testWidgets('renders the ${component.id} preview', (tester) async {
      tester.view.devicePixelRatio = 1;
      tester.view.physicalSize = const Size(800, 1000);
      addTearDown(() {
        tester.view.resetDevicePixelRatio();
        tester.view.resetPhysicalSize();
      });

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: ComponentDemoPreview(
                component: component,
                configuration: const DemoConfiguration(),
              ),
            ),
          ),
        ),
      );
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.byType(ComponentDemoPreview), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('image selector updates the selected sample', (tester) async {
    final component = components.firstWhere(
      (item) => item.id == 'image-selector',
    );
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ComponentDemoPreview(
            component: component,
            configuration: const DemoConfiguration(),
          ),
        ),
      ),
    );

    expect(find.text('Selecciona una imagen de ejemplo'), findsOneWidget);
    await tester.tap(find.byType(InkWell).first);
    await tester.pump();
    expect(find.text('Imagen 1 seleccionada'), findsOneWidget);
  });

  testWidgets('file selector returns a safe sample document', (tester) async {
    final component = components.firstWhere(
      (item) => item.id == 'file-selector',
    );
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ComponentDemoPreview(
            component: component,
            configuration: const DemoConfiguration(),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Elegir archivo'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('datos.csv'));
    await tester.pumpAndSettle();
    expect(find.text('datos.csv'), findsOneWidget);
  });
}
