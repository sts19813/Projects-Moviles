import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_catalog/app/app.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/widgets/catalog_component_card.dart';
import 'package:flutter_ui_catalog/features/settings/display_preferences_controller.dart';
import 'package:flutter_ui_catalog/features/settings/theme_controller.dart';

void main() {
  testWidgets('shows splash and opens the responsive home page', (
    tester,
  ) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(390, 844);
    addTearDown(() {
      tester.view.resetDevicePixelRatio();
      tester.view.resetPhysicalSize();
    });

    await tester.pumpWidget(const ProviderScope(child: FlutterUiCatalogApp()));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pump(const Duration(milliseconds: 700));
    await tester.pumpAndSettle();

    expect(find.text('40 componentes disponibles'), findsOneWidget);
    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.text('Recientes'), findsOneWidget);
  });

  testWidgets('uses a navigation rail on tablet widths', (tester) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(900, 1000);
    addTearDown(() {
      tester.view.resetDevicePixelRatio();
      tester.view.resetPhysicalSize();
    });

    await tester.pumpWidget(const ProviderScope(child: FlutterUiCatalogApp()));
    await tester.pump(const Duration(milliseconds: 700));
    await tester.pumpAndSettle();

    expect(find.byType(NavigationRail), findsOneWidget);
    expect(find.byType(NavigationBar), findsNothing);
  });

  testWidgets('navigates to settings from the bottom navigation', (
    tester,
  ) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(390, 844);
    addTearDown(() {
      tester.view.resetDevicePixelRatio();
      tester.view.resetPhysicalSize();
    });

    await tester.pumpWidget(const ProviderScope(child: FlutterUiCatalogApp()));
    await tester.pump(const Duration(milliseconds: 700));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Configuración').last);
    await tester.pumpAndSettle();

    expect(find.text('Apariencia'), findsOneWidget);
    expect(find.text('Material 3'), findsOneWidget);
  });

  testWidgets('opens the catalog and filters Cupertino components', (
    tester,
  ) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(390, 844);
    addTearDown(() {
      tester.view.resetDevicePixelRatio();
      tester.view.resetPhysicalSize();
    });

    await tester.pumpWidget(const ProviderScope(child: FlutterUiCatalogApp()));
    await tester.pump(const Duration(milliseconds: 700));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Catálogo').last);
    await tester.pumpAndSettle();

    expect(find.text('40 componentes'), findsOneWidget);
    expect(find.text('FilledButton'), findsOneWidget);

    await tester.tap(find.text('Cupertino').first);
    await tester.pumpAndSettle();

    expect(find.text('3 componentes'), findsOneWidget);
    expect(
      find.descendant(
        of: find.byType(CatalogComponentCard),
        matching: find.text('CupertinoButton'),
      ),
      findsOneWidget,
    );
  });

  testWidgets('searches components while the user types', (tester) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(390, 844);
    addTearDown(() {
      tester.view.resetDevicePixelRatio();
      tester.view.resetPhysicalSize();
    });

    await tester.pumpWidget(const ProviderScope(child: FlutterUiCatalogApp()));
    await tester.pump(const Duration(milliseconds: 700));
    await tester.pumpAndSettle();

    await tester.tap(find.byType(TextField).first);
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'CupertinoButton');
    await tester.pump();

    expect(
      find.descendant(
        of: find.byType(CatalogComponentCard),
        matching: find.text('CupertinoButton'),
      ),
      findsOneWidget,
    );
    expect(find.text('FilledButton'), findsNothing);
  });

  testWidgets('opens a component detail with five tabs', (tester) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(390, 844);
    addTearDown(() {
      tester.view.resetDevicePixelRatio();
      tester.view.resetPhysicalSize();
    });

    await tester.pumpWidget(const ProviderScope(child: FlutterUiCatalogApp()));
    await tester.pump(const Duration(milliseconds: 700));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Catálogo').last);
    await tester.pumpAndSettle();
    await tester.tap(find.text('FilledButton'));
    await tester.pumpAndSettle();

    expect(find.text('Vista previa'), findsOneWidget);
    expect(find.text('Variantes'), findsOneWidget);
    expect(find.text('Código'), findsOneWidget);
    expect(find.text('Propiedades'), findsOneWidget);
    expect(find.text('Notas'), findsOneWidget);
    expect(
      find.text('Botón principal de alto énfasis de Material 3.'),
      findsOneWidget,
    );
  });

  test('theme and display preferences can change and reset', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    container
        .read(themeControllerProvider.notifier)
        .setTheme(AppThemePreference.dark);
    container
        .read(displayPreferencesProvider.notifier)
        .setDensity(AppDensity.compact);

    expect(container.read(themeControllerProvider), AppThemePreference.dark);
    expect(
      container.read(displayPreferencesProvider).density,
      AppDensity.compact,
    );

    container.read(displayPreferencesProvider.notifier).reset();

    expect(
      container.read(displayPreferencesProvider).density,
      AppDensity.comfortable,
    );
  });
}
