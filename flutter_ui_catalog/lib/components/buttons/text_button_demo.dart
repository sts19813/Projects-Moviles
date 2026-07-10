import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/core/helpers/demo_feedback.dart';

class TextButtonDemo extends StatelessWidget {
  const TextButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDemoMessage(context, 'Acción cancelada'),
      child: const Text('Cancelar'),
    );
  }
}
