import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/app/theme/app_spacing.dart';

class ColumnDemo extends StatelessWidget {
  const ColumnDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(Icons.cloud_outlined, size: 48),
        SizedBox(height: AppSpacing.sm),
        Text('Sincronización'),
        SizedBox(height: AppSpacing.sm),
        LinearProgressIndicator(value: 0.7),
      ],
    );
  }
}
