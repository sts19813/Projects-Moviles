import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/core/helpers/demo_feedback.dart';

class IconButtonDemo extends StatelessWidget {
  const IconButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      tooltip: 'Agregar a favoritos',
      onPressed: () => showDemoMessage(context, 'Agregado a favoritos'),
      icon: const Icon(Icons.favorite_outline),
    );
  }
}
