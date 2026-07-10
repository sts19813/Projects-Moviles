import 'package:flutter/material.dart';

class SizedBoxDemo extends StatelessWidget {
  const SizedBoxDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        FilledButton(onPressed: null, child: Text('Uno')),
        SizedBox(width: 32),
        FilledButton(onPressed: null, child: Text('Dos')),
      ],
    );
  }
}
