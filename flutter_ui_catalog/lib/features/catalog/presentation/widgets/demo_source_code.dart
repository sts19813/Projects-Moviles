import 'package:flutter_ui_catalog/features/catalog/data/registries/advanced_component_source_codes.dart';
import 'package:flutter_ui_catalog/features/catalog/data/registries/basic_component_source_codes.dart';
import 'package:flutter_ui_catalog/features/catalog/data/registries/cupertino_chart_source_codes.dart';
import 'package:flutter_ui_catalog/features/catalog/data/registries/layout_media_source_codes.dart';
import 'package:flutter_ui_catalog/features/catalog/domain/models/catalog_component.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/controllers/demo_configuration_controller.dart';

abstract final class DemoSourceCode {
  static String forComponent(
    CatalogComponent component,
    DemoConfiguration configuration,
  ) {
    return switch (component.id) {
      'filled-button' => _filledButton(configuration),
      'text-field' => _textField(configuration),
      _ when basicComponentSourceCodes.containsKey(component.id) =>
        basicComponentSourceCodes[component.id]!,
      _ when advancedComponentSourceCodes.containsKey(component.id) =>
        advancedComponentSourceCodes[component.id]!,
      _ when layoutMediaSourceCodes.containsKey(component.id) =>
        layoutMediaSourceCodes[component.id]!,
      _ when cupertinoChartSourceCodes.containsKey(component.id) =>
        cupertinoChartSourceCodes[component.id]!,
      _ when component.sourceCode.isNotEmpty => component.sourceCode,
      _ =>
        '''${component.name}(
  // Configura aquí las propiedades del componente.
)''',
    };
  }

  static String _filledButton(DemoConfiguration configuration) {
    final label = _escape(configuration.buttonLabel);
    final callback = configuration.buttonEnabled && !configuration.buttonLoading
        ? '() {}'
        : 'null';
    final size = switch (configuration.buttonSize) {
      DemoButtonSize.small => 'const Size(0, 40)',
      DemoButtonSize.medium => 'const Size(0, 48)',
      DemoButtonSize.large => 'const Size(0, 56)',
    };
    final constructor = configuration.buttonShowIcon
        ? '''FilledButton.icon(
    onPressed: $callback,
    style: FilledButton.styleFrom(
      minimumSize: $size,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(${configuration.buttonRadius.round()}),
      ),
    ),
    icon: const Icon(Icons.arrow_forward),
    label: const Text('$label'),
  )'''
        : '''FilledButton(
    onPressed: $callback,
    style: FilledButton.styleFrom(
      minimumSize: $size,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(${configuration.buttonRadius.round()}),
      ),
    ),
    child: ${configuration.buttonLoading ? 'const CircularProgressIndicator()' : "const Text('$label')"},
  )''';

    return configuration.buttonFullWidth
        ? '''SizedBox(
  width: double.infinity,
  child: $constructor,
)'''
        : constructor;
  }

  static String _textField(DemoConfiguration configuration) {
    return '''TextField(
  obscureText: ${configuration.fieldObscureText},
  maxLength: ${configuration.fieldMaxLength},
  decoration: InputDecoration(
    labelText: '${_escape(configuration.fieldLabel)}',
    hintText: '${_escape(configuration.fieldHint)}',
    prefixIcon: ${configuration.fieldShowIcon ? 'const Icon(Icons.person_outline)' : 'null'},
    errorText: ${configuration.fieldShowError ? "'Valor no válido'" : 'null'},
  ),
)''';
  }

  static String _escape(String value) {
    return value.replaceAll(r'\', r'\\').replaceAll("'", r"\'");
  }
}
