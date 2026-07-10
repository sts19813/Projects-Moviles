import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_catalog/shared/platform_adaptive/adaptive_activity_indicator.dart';
import 'package:flutter_ui_catalog/shared/platform_adaptive/adaptive_button.dart';
import 'package:flutter_ui_catalog/shared/platform_adaptive/adaptive_dialog.dart';
import 'package:flutter_ui_catalog/shared/platform_adaptive/adaptive_navigation.dart';
import 'package:flutter_ui_catalog/shared/platform_adaptive/adaptive_scaffold.dart';
import 'package:flutter_ui_catalog/shared/platform_adaptive/adaptive_switch.dart';

void main() {
  testWidgets('adaptive controls render their Material branch off iOS', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: <Widget>[
              AdaptiveButton(onPressed: () {}, child: const Text('Acción')),
              const AdaptiveSwitch(value: true, onChanged: null),
              const AdaptiveActivityIndicator(value: 0.5),
              const AdaptiveDialog(
                title: Text('Título'),
                content: Text('Contenido'),
                actions: <Widget>[],
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.byType(FilledButton), findsOneWidget);
    expect(find.byType(Switch), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.byType(AlertDialog), findsOneWidget);
  });

  testWidgets('adaptive navigation and scaffold render Material layouts', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: AdaptiveScaffold(
          title: 'Catálogo adaptativo',
          body: const Text('Contenido'),
          bottomNavigationBar: AdaptiveNavigation(
            currentIndex: 0,
            onDestinationSelected: (_) {},
            destinations: const <AdaptiveNavigationDestination>[
              AdaptiveNavigationDestination(icon: Icons.home, label: 'Inicio'),
              AdaptiveNavigationDestination(
                icon: Icons.settings,
                label: 'Ajustes',
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.text('Catálogo adaptativo'), findsOneWidget);
    expect(find.byType(NavigationBar), findsOneWidget);
  });
}
