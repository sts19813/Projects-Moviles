import 'package:flutter/material.dart';

class CenterDemo extends StatelessWidget {
  const CenterDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 140,
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: const Center(child: FlutterLogo(size: 72)),
    );
  }
}
