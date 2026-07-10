import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/app/theme/app_spacing.dart';

class WrapDemo extends StatelessWidget {
  const WrapDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: const <Widget>[
        Chip(label: Text('Flutter')),
        Chip(label: Text('Dart')),
        Chip(label: Text('Material 3')),
        Chip(label: Text('Cupertino')),
        Chip(label: Text('Riverpod')),
      ],
    );
  }
}
