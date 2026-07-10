import 'package:flutter/material.dart';

class AlignDemo extends StatelessWidget {
  const AlignDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 140,
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: const Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Chip(label: Text('Abajo · derecha')),
        ),
      ),
    );
  }
}
