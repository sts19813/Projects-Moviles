import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/app/theme/app_spacing.dart';

class RowDemo extends StatelessWidget {
  const RowDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (final icon in <IconData>[
          Icons.home,
          Icons.search,
          Icons.person,
        ]) ...<Widget>[
          ColoredBox(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Icon(icon),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
        ],
      ],
    );
  }
}
