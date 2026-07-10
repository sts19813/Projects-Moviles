import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_catalog/components/buttons/filled_button_demo.dart';
import 'package:flutter_ui_catalog/components/cards/card_demo.dart';
import 'package:flutter_ui_catalog/components/inputs/text_field_demo.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/controllers/demo_configuration_controller.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  testWidgets('FilledButton golden', (tester) async {
    _setGoldenSurface(tester);
    await tester.pumpWidget(
      const _GoldenFrame(
        child: FilledButtonDemo(configuration: DemoConfiguration()),
      ),
    );

    await expectLater(
      find.byType(_GoldenFrame),
      matchesGoldenFile('goldens/filled_button.png'),
    );
  });

  testWidgets('Card golden', (tester) async {
    _setGoldenSurface(tester);
    await tester.pumpWidget(const _GoldenFrame(child: CardDemo()));

    await expectLater(
      find.byType(_GoldenFrame),
      matchesGoldenFile('goldens/card.png'),
    );
  });

  testWidgets('TextField golden', (tester) async {
    _setGoldenSurface(tester);
    await tester.pumpWidget(
      const _GoldenFrame(
        child: TextFieldDemo(configuration: DemoConfiguration()),
      ),
    );

    await expectLater(
      find.byType(_GoldenFrame),
      matchesGoldenFile('goldens/text_field.png'),
    );
  });
}

void _setGoldenSurface(WidgetTester tester) {
  tester.view.devicePixelRatio = 1;
  tester.view.physicalSize = const Size(420, 300);
  addTearDown(() {
    tester.view.resetDevicePixelRatio();
    tester.view.resetPhysicalSize();
  });
}

class _GoldenFrame extends StatelessWidget {
  const _GoldenFrame({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6750A4)),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFFFFBFE),
        body: Center(
          child: Padding(padding: const EdgeInsets.all(24), child: child),
        ),
      ),
    );
  }
}
