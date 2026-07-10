import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoDatePickerDemo extends StatefulWidget {
  const CupertinoDatePickerDemo({super.key});

  @override
  State<CupertinoDatePickerDemo> createState() =>
      _CupertinoDatePickerDemoState();
}

class _CupertinoDatePickerDemoState extends State<CupertinoDatePickerDemo> {
  DateTime _selectedDate = DateTime(2026, 7, 10);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          'Fecha: ${_selectedDate.day.toString().padLeft(2, '0')}/'
          '${_selectedDate.month.toString().padLeft(2, '0')}/'
          '${_selectedDate.year}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 216,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: _selectedDate,
            minimumDate: DateTime(2020),
            maximumDate: DateTime(2035, 12, 31),
            onDateTimeChanged: (date) => setState(() => _selectedDate = date),
          ),
        ),
      ],
    );
  }
}
