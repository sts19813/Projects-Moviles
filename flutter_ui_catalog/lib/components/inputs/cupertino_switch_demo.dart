import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_catalog/app/theme/app_spacing.dart';

class CupertinoSwitchDemo extends StatefulWidget {
  const CupertinoSwitchDemo({super.key});

  @override
  State<CupertinoSwitchDemo> createState() => _CupertinoSwitchDemoState();
}

class _CupertinoSwitchDemoState extends State<CupertinoSwitchDemo> {
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Text('Actualizaciones automáticas'),
        const SizedBox(width: AppSpacing.md),
        CupertinoSwitch(
          value: _enabled,
          onChanged: (value) => setState(() => _enabled = value),
        ),
      ],
    );
  }
}
