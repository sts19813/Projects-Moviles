import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/core/helpers/demo_feedback.dart';

class OutlinedButtonDemo extends StatelessWidget {
  const OutlinedButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => showDemoMessage(context, 'Acción secundaria'),
      child: const Text('Más información'),
    );
  }
}
