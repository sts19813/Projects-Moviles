import 'package:flutter/material.dart';

class ExpandedDemo extends StatelessWidget {
  const ExpandedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: 360,
      height: 90,
      child: Row(
        children: <Widget>[
          ColoredBox(
            color: colors.primaryContainer,
            child: const SizedBox(
              width: 70,
              height: 90,
              child: Center(child: Text('Fijo')),
            ),
          ),
          Expanded(
            child: ColoredBox(
              color: colors.tertiaryContainer,
              child: const Center(child: Text('Expanded')),
            ),
          ),
        ],
      ),
    );
  }
}
