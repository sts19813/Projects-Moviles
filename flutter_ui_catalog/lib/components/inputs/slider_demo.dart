import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  const SliderDemo({super.key});

  @override
  State<SliderDemo> createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double _value = 40;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('Volumen: ${_value.round()}%'),
        Slider(
          value: _value,
          max: 100,
          divisions: 10,
          label: _value.round().toString(),
          onChanged: (value) => setState(() => _value = value),
        ),
      ],
    );
  }
}
