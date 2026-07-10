import 'package:flutter/material.dart';

class SliverGridDemo extends StatelessWidget {
  const SliverGridDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      height: 240,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverGrid.builder(
            itemCount: 12,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) => ColoredBox(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Center(child: Text('${index + 1}')),
            ),
          ),
        ],
      ),
    );
  }
}
