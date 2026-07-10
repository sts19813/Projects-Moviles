import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/core/helpers/demo_feedback.dart';
import 'package:flutter_ui_catalog/shared/platform_adaptive/adaptive_button.dart';

class AdaptiveButtonDemo extends StatelessWidget {
  const AdaptiveButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveButton(
      onPressed: () => showDemoMessage(context, 'Botón adaptativo presionado'),
      child: const Text('Acción adaptativa'),
    );
  }
}
