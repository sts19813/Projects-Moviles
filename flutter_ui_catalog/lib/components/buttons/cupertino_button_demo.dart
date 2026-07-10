import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_catalog/core/helpers/demo_feedback.dart';

class CupertinoButtonDemo extends StatelessWidget {
  const CupertinoButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      onPressed: () => showDemoMessage(context, 'CupertinoButton presionado'),
      child: const Text('Continuar'),
    );
  }
}
