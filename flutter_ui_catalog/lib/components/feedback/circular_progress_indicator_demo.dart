import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/app/theme/app_spacing.dart';

class CircularProgressIndicatorDemo extends StatefulWidget {
  const CircularProgressIndicatorDemo({super.key});

  @override
  State<CircularProgressIndicatorDemo> createState() =>
      _CircularProgressIndicatorDemoState();
}

class _CircularProgressIndicatorDemoState
    extends State<CircularProgressIndicatorDemo> {
  double _progress = 0.65;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SizedBox.square(
              dimension: 72,
              child: CircularProgressIndicator(
                value: _progress,
                strokeWidth: 7,
              ),
            ),
            Text('${(_progress * 100).round()}%'),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        SizedBox(
          width: 260,
          child: Slider(
            value: _progress,
            onChanged: (value) => setState(() => _progress = value),
          ),
        ),
      ],
    );
  }
}
