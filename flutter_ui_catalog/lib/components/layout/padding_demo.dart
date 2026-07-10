import 'package:flutter/material.dart';

class PaddingDemo extends StatelessWidget {
  const PaddingDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: const Padding(
        padding: EdgeInsets.all(32),
        child: ColoredBox(
          color: Colors.white,
          child: Padding(padding: EdgeInsets.all(12), child: Text('32 px')),
        ),
      ),
    );
  }
}
