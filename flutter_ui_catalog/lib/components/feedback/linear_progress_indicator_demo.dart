import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/app/theme/app_spacing.dart';

class LinearProgressIndicatorDemo extends StatefulWidget {
  const LinearProgressIndicatorDemo({super.key});

  @override
  State<LinearProgressIndicatorDemo> createState() =>
      _LinearProgressIndicatorDemoState();
}

class _LinearProgressIndicatorDemoState
    extends State<LinearProgressIndicatorDemo> {
  double _progress = 0.4;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          LinearProgressIndicator(value: _progress),
          const SizedBox(height: AppSpacing.sm),
          Text('${(_progress * 100).round()}% completado'),
          Slider(
            value: _progress,
            onChanged: (value) => setState(() => _progress = value),
          ),
        ],
      ),
    );
  }
}
