import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/core/helpers/demo_feedback.dart';

class ListTileDemo extends StatelessWidget {
  const ListTileDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.person_outline)),
        title: const Text('María Santos'),
        subtitle: const Text('Diseñadora de producto'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => showDemoMessage(context, 'Perfil seleccionado'),
      ),
    );
  }
}
