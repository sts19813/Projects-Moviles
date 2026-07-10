import 'package:flutter/material.dart';

class GridViewDemo extends StatefulWidget {
  const GridViewDemo({super.key});

  @override
  State<GridViewDemo> createState() => _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo> {
  int? _selected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      width: 320,
      child: GridView.builder(
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          final selected = _selected == index;
          return InkWell(
            onTap: () => setState(() => _selected = index),
            child: ColoredBox(
              color: selected
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.surfaceContainerHighest,
              child: Center(child: Text('${index + 1}')),
            ),
          );
        },
      ),
    );
  }
}
