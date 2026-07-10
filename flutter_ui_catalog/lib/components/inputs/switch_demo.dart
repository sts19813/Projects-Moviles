import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  const SwitchDemo({super.key});

  @override
  State<SwitchDemo> createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text('Notificaciones'),
      subtitle: Text(_enabled ? 'Activadas' : 'Desactivadas'),
      value: _enabled,
      onChanged: (value) => setState(() => _enabled = value),
    );
  }
}
