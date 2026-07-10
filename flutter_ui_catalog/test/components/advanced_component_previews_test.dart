import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_catalog/features/catalog/data/registries/advanced_component_source_codes.dart';
import 'package:flutter_ui_catalog/features/catalog/data/registries/catalog_registry.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/controllers/demo_configuration_controller.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/widgets/component_demo_preview.dart';

const _advancedCategories = <String>{
  'dialogs',
  'feedback',
  'data-display',
  'animations',
};

void main() {
  final advancedComponents = catalogRegistry
      .where((component) => _advancedCategories.contains(component.categoryId))
      .toList(growable: false);

  test('all 12 advanced components have a specific source example', () {
    expect(advancedComponents, hasLength(12));
    expect(advancedComponentSourceCodes, hasLength(12));
    for (final component in advancedComponents) {
      expect(
        advancedComponentSourceCodes.containsKey(component.id),
        isTrue,
        reason: '${component.id} does not have a source example',
      );
    }
  });

  for (final component in advancedComponents) {
    testWidgets('renders the ${component.id} advanced preview', (tester) async {
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

      expect(find.byType(ComponentDemoPreview), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('AlertDialog preview opens and closes its dialog', (
    tester,
  ) async {
    final component = advancedComponents.firstWhere(
      (item) => item.id == 'alert-dialog',
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

    await tester.tap(find.text('Abrir AlertDialog'));
    await tester.pumpAndSettle();
    expect(find.text('Eliminar elemento'), findsOneWidget);
    await tester.tap(find.text('Cancelar'));
    await tester.pumpAndSettle();
    expect(find.text('Eliminar elemento'), findsNothing);
  });
}
