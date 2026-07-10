import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  const RadioDemo({super.key});

  @override
  State<RadioDemo> createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  String? _selection = 'personal';

  @override
  Widget build(BuildContext context) {
    return RadioGroup<String>(
      groupValue: _selection,
      onChanged: (value) => setState(() => _selection = value),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Radio<String>(value: 'personal'),
              Text('Personal'),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Radio<String>(value: 'business'),
              Text('Empresa'),
            ],
          ),
        ],
      ),
    );
  }
}
