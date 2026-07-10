import 'package:flutter/material.dart';

class LayoutBuilderDemo extends StatelessWidget {
  const LayoutBuilderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final wide = constraints.maxWidth >= 500;
          return Container(
            height: 130,
            color: wide
                ? Theme.of(context).colorScheme.tertiaryContainer
                : Theme.of(context).colorScheme.primaryContainer,
            alignment: Alignment.center,
            child: Text(
              wide
                  ? 'Diseño amplio · ${constraints.maxWidth.round()} px'
                  : 'Diseño compacto · ${constraints.maxWidth.round()} px',
            ),
          );
        },
      ),
    );
  }
}
