import 'package:flutter/material.dart';

class AspectRatioDemo extends StatelessWidget {
  const AspectRatioDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ColoredBox(
          color: Theme.of(context).colorScheme.secondaryContainer,
          child: const Center(child: Text('16 : 9')),
        ),
      ),
    );
  }
}
