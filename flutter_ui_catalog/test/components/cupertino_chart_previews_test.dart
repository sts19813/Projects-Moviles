import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_catalog/features/catalog/data/registries/catalog_registry.dart';
import 'package:flutter_ui_catalog/features/catalog/data/registries/cupertino_chart_source_codes.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/controllers/demo_configuration_controller.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/widgets/component_demo_preview.dart';

const _componentIds = <String>{
  'cupertino-date-picker',
  'cupertino-picker',
  'cupertino-time-picker',
  'cupertino-modal-popup-route',
  'bar-chart',
  'pie-chart',
  'line-chart',
  'area-chart',
  'scatter-chart',
  'radar-chart',
};

void main() {
  final components = catalogRegistry
      .where((component) => _componentIds.contains(component.id))
      .toList(growable: false);

  test('all Cupertino and chart additions have source examples', () {
    expect(components, hasLength(10));
    expect(cupertinoChartSourceCodes, hasLength(10));
    for (final component in components) {
      expect(cupertinoChartSourceCodes.containsKey(component.id), isTrue);
    }
  });

  for (final component in components) {
    testWidgets('renders the ${component.id} preview', (tester) async {
      tester.view.devicePixelRatio = 1;
      tester.view.physicalSize = const Size(900, 1100);
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

  testWidgets('Cupertino modal popup route opens and closes', (tester) async {
    final component = components.firstWhere(
      (item) => item.id == 'cupertino-modal-popup-route',
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

    await tester.tap(find.text('Abrir modal Cupertino'));
    await tester.pumpAndSettle();
    expect(find.text('Selecciona una acción'), findsOneWidget);
    await tester.tap(find.text('Cancelar'));
    await tester.pumpAndSettle();
    expect(find.text('Selecciona una acción'), findsNothing);
  });
}
