import 'package:flutter/material.dart';

class StackDemo extends StatelessWidget {
  const StackDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 160,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const Center(child: Icon(Icons.photo, size: 64)),
          const Positioned(top: 8, right: 8, child: Badge(label: Text('3'))),
        ],
      ),
    );
  }
}
