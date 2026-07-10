import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/app/theme/app_spacing.dart';

class ChipDemo extends StatefulWidget {
  const ChipDemo({super.key});

  @override
  State<ChipDemo> createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  final Set<String> _selected = <String>{'Flutter'};

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.sm,
      children: <Widget>[
        for (final label in <String>['Flutter', 'Dart', 'Material 3'])
          FilterChip(
            label: Text(label),
            selected: _selected.contains(label),
            onSelected: (selected) {
              setState(() {
                selected ? _selected.add(label) : _selected.remove(label);
              });
            },
          ),
      ],
    );
  }
}
