import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/app/theme/app_radius.dart';
import 'package:flutter_ui_catalog/app/theme/app_spacing.dart';

class ComponentPreviewFrame extends StatelessWidget {
  const ComponentPreviewFrame({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 220),
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: child,
    );
  }
}
