import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/app/theme/app_spacing.dart';

class AnimatedOpacityDemo extends StatefulWidget {
  const AnimatedOpacityDemo({super.key});

  @override
  State<AnimatedOpacityDemo> createState() => _AnimatedOpacityDemoState();
}

class _AnimatedOpacityDemoState extends State<AnimatedOpacityDemo> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AnimatedOpacity(
          opacity: _visible ? 1 : 0.15,
          duration: const Duration(milliseconds: 350),
          child: const FlutterLogo(size: 88),
        ),
        const SizedBox(height: AppSpacing.md),
        FilledButton.tonal(
          onPressed: () => setState(() => _visible = !_visible),
          child: Text(_visible ? 'Atenuar' : 'Mostrar'),
        ),
      ],
    );
  }
}
