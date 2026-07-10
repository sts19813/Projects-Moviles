import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/app/theme/app_spacing.dart';

class FlexibleDemo extends StatelessWidget {
  const FlexibleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 360,
      child: Row(
        children: <Widget>[
          Icon(Icons.info_outline),
          SizedBox(width: AppSpacing.sm),
          Flexible(
            child: Text(
              'Este texto utiliza únicamente el espacio que necesita y puede ajustarse en varias líneas.',
            ),
          ),
        ],
      ),
    );
  }
}
