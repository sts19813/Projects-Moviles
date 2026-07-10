import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/core/helpers/demo_feedback.dart';

class FloatingActionButtonDemo extends StatelessWidget {
  const FloatingActionButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: 'catalog-demo-fab',
      onPressed: () => showDemoMessage(context, 'Nuevo elemento'),
      icon: const Icon(Icons.add),
      label: const Text('Crear'),
    );
  }
}
