import 'package:flutter/material.dart';

class CheckboxDemo extends StatefulWidget {
  const CheckboxDemo({super.key});

  @override
  State<CheckboxDemo> createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {
  bool _accepted = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: const Text('Acepto los términos'),
      value: _accepted,
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (value) => setState(() => _accepted = value ?? false),
    );
  }
}
