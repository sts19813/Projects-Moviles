import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_catalog/features/catalog/data/registries/basic_component_source_codes.dart';
import 'package:flutter_ui_catalog/features/catalog/data/registries/catalog_registry.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/controllers/demo_configuration_controller.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/widgets/component_demo_preview.dart';
import 'package:flutter_ui_catalog/shared/component_preview/component_preview_frame.dart';

const _basicCategories = <String>{
  'buttons',
  'inputs',
  'cards',
  'lists',
  'navigation',
};

void main() {
  final basicComponents = catalogRegistry
      .where((component) => _basicCategories.contains(component.categoryId))
      .toList(growable: false);

  test('all 28 basic components have a specific source example', () {
    expect(basicComponents, hasLength(28));
    for (final component in basicComponents) {
      final isDynamic =
          component.id == 'filled-button' || component.id == 'text-field';
      expect(
        isDynamic || basicComponentSourceCodes.containsKey(component.id),
        isTrue,
        reason: '${component.id} does not have a source example',
      );
    }
  });

  for (final component in basicComponents) {
    testWidgets('renders the ${component.id} interactive preview', (
      tester,
    ) async {
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

      expect(
        find.textContaining('implementación avanzada'),
        findsNothing,
        reason: '${component.id} is still using the pending preview',
      );
      expect(find.byType(ComponentDemoPreview), findsOneWidget);
    });
  }

  testWidgets('checkbox preview changes its selected value', (tester) async {
    final component = basicComponents.firstWhere(
      (item) => item.id == 'checkbox',
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

    expect(tester.widget<Checkbox>(find.byType(Checkbox)).value, isFalse);
    await tester.tap(find.text('Acepto los términos'));
    await tester.pump();
    expect(tester.widget<Checkbox>(find.byType(Checkbox)).value, isTrue);
  });

  testWidgets(
    'list controls render safely inside the decorated preview frame',
    (tester) async {
      final component = basicComponents.firstWhere(
        (item) => item.id == 'switch',
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ComponentPreviewFrame(
              child: ComponentDemoPreview(
                component: component,
                configuration: const DemoConfiguration(),
              ),
            ),
          ),
        ),
      );

      expect(tester.takeException(), isNull);
      await tester.tap(find.text('Notificaciones'));
      await tester.pump();
      expect(tester.takeException(), isNull);
    },
  );
}
