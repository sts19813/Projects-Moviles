import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoPickerDemo extends StatefulWidget {
  const CupertinoPickerDemo({super.key});

  @override
  State<CupertinoPickerDemo> createState() => _CupertinoPickerDemoState();
}

class _CupertinoPickerDemoState extends State<CupertinoPickerDemo> {
  static const _cities = <String>[
    'Mérida',
    'Ciudad de México',
    'Monterrey',
    'Guadalajara',
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          'Ciudad: ${_cities[_selectedIndex]}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 200,
          child: CupertinoPicker(
            itemExtent: 44,
            useMagnifier: true,
            magnification: 1.08,
            scrollController: FixedExtentScrollController(
              initialItem: _selectedIndex,
            ),
            onSelectedItemChanged: (index) {
              setState(() => _selectedIndex = index);
            },
            children: _cities.map((city) => Center(child: Text(city))).toList(),
          ),
        ),
      ],
    );
  }
}
