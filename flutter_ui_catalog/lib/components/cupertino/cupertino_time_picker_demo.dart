import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTimePickerDemo extends StatefulWidget {
  const CupertinoTimePickerDemo({super.key});

  @override
  State<CupertinoTimePickerDemo> createState() =>
      _CupertinoTimePickerDemoState();
}

class _CupertinoTimePickerDemoState extends State<CupertinoTimePickerDemo> {
  DateTime _selectedTime = DateTime(2026, 7, 10, 9, 30);

  @override
  Widget build(BuildContext context) {
    final hour = _selectedTime.hour.toString().padLeft(2, '0');
    final minute = _selectedTime.minute.toString().padLeft(2, '0');

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          'Hora: $hour:$minute',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.time,
            initialDateTime: _selectedTime,
            minuteInterval: 5,
            use24hFormat: true,
            onDateTimeChanged: (time) => setState(() => _selectedTime = time),
          ),
        ),
      ],
    );
  }
}
