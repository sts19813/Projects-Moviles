import 'package:flutter/material.dart';

class SafeAreaDemo extends StatelessWidget {
  const SafeAreaDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return SizedBox(
      width: 280,
      height: 170,
      child: ColoredBox(
        color: Theme.of(context).colorScheme.errorContainer,
        child: MediaQuery(
          data: media.copyWith(padding: const EdgeInsets.only(top: 32)),
          child: SafeArea(
            child: ColoredBox(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: const Center(child: Text('Contenido seguro')),
            ),
          ),
        ),
      ),
    );
  }
}
