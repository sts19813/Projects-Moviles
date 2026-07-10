import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/core/helpers/demo_feedback.dart';

class SnackBarDemo extends StatelessWidget {
  const SnackBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () =>
          showDemoMessage(context, 'Cambios guardados correctamente'),
      child: const Text('Mostrar SnackBar'),
    );
  }
}
