import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/app/theme/app_spacing.dart';

class TextFormFieldDemo extends StatefulWidget {
  const TextFormFieldDemo({super.key});

  @override
  State<TextFormFieldDemo> createState() => _TextFormFieldDemoState();
}

class _TextFormFieldDemoState extends State<TextFormFieldDemo> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Correo electrónico',
                prefixIcon: Icon(Icons.email_outlined),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                return value != null && value.contains('@')
                    ? null
                    : 'Ingresa un correo válido';
              },
            ),
            const SizedBox(height: AppSpacing.md),
            FilledButton(
              onPressed: () => _formKey.currentState?.validate(),
              child: const Text('Validar'),
            ),
          ],
        ),
      ),
    );
  }
}
