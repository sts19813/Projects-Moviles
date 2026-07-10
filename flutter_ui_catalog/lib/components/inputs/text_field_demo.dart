import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/controllers/demo_configuration_controller.dart';

class TextFieldDemo extends StatelessWidget {
  const TextFieldDemo({required this.configuration, super.key});

  final DemoConfiguration configuration;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 480),
      child: TextField(
        obscureText: configuration.fieldObscureText,
        maxLength: configuration.fieldMaxLength,
        decoration: InputDecoration(
          labelText: configuration.fieldLabel,
          hintText: configuration.fieldHint,
          prefixIcon: configuration.fieldShowIcon
              ? const Icon(Icons.person_outline)
              : null,
          errorText: configuration.fieldShowError ? 'Valor no válido' : null,
        ),
      ),
    );
  }
}
