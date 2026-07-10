import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_catalog/features/catalog/data/registries/catalog_registry.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/controllers/demo_configuration_controller.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/widgets/demo_source_code.dart';

void main() {
  test('button playground configuration updates generated source code', () {
    final component = catalogRegistry.firstWhere(
      (item) => item.id == 'filled-button',
    );
    final configuration = const DemoConfiguration().copyWith(
      buttonLabel: 'Guardar',
      buttonFullWidth: true,
      buttonShowIcon: true,
      buttonRadius: 24,
    );

    final source = DemoSourceCode.forComponent(component, configuration);

    expect(source, contains("Text('Guardar')"));
    expect(source, contains('double.infinity'));
    expect(source, contains('FilledButton.icon'));
    expect(source, contains('BorderRadius.circular(24)'));
  });

  test('demo configurations are stored per component and can reset', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final controller = container.read(demoConfigurationsProvider.notifier);

    controller.update(
      'filled-button',
      const DemoConfiguration(buttonLabel: 'Enviar'),
    );
    controller.update(
      'text-field',
      const DemoConfiguration(fieldLabel: 'Correo'),
    );

    expect(
      container.read(demoConfigurationsProvider)['filled-button']?.buttonLabel,
      'Enviar',
    );
    expect(
      container.read(demoConfigurationsProvider)['text-field']?.fieldLabel,
      'Correo',
    );

    controller.reset('filled-button');

    expect(
      container.read(demoConfigurationsProvider).containsKey('filled-button'),
      isFalse,
    );
  });
}
