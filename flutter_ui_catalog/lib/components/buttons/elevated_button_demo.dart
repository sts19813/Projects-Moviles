import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/core/helpers/demo_feedback.dart';

class ElevatedButtonDemo extends StatelessWidget {
  const ElevatedButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => showDemoMessage(context, 'ElevatedButton presionado'),
      icon: const Icon(Icons.upload),
      label: const Text('Subir archivo'),
    );
  }
}
