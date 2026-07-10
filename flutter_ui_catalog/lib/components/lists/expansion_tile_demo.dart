import 'package:flutter/material.dart';

class ExpansionTileDemo extends StatelessWidget {
  const ExpansionTileDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card.outlined(
      child: ExpansionTile(
        leading: Icon(Icons.help_outline),
        title: Text('¿Qué es Material 3?'),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Es la versión más reciente del sistema de diseño de Material.',
            ),
          ),
        ],
      ),
    );
  }
}
