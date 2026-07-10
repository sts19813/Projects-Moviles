import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_catalog/shared/code_viewer/code_viewer.dart';

void main() {
  testWidgets('copies code and confirms the action', (tester) async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          SystemChannels.platform,
          (call) async => null,
        );
    addTearDown(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(SystemChannels.platform, null);
    });

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: CodeViewer(code: 'FilledButton(onPressed: null)')),
      ),
    );

    await tester.tap(find.byTooltip('Copiar código'));
    await tester.pumpAndSettle();

    expect(find.text('Código copiado al portapapeles'), findsOneWidget);
  });

  testWidgets('expands and contracts the code area', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: CodeViewer(code: 'const value = 1;')),
      ),
    );

    expect(find.text('Expandir'), findsOneWidget);
    await tester.tap(find.text('Expandir'));
    await tester.pumpAndSettle();
    expect(find.text('Contraer'), findsOneWidget);
  });
}
