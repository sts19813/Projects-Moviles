import 'package:flutter/material.dart';

class TimePickerDemo extends StatefulWidget {
  const TimePickerDemo({super.key});

  @override
  State<TimePickerDemo> createState() => _TimePickerDemoState();
}

class _TimePickerDemoState extends State<TimePickerDemo> {
  TimeOfDay _time = const TimeOfDay(hour: 9, minute: 30);

  Future<void> _selectTime() async {
    final time = await showTimePicker(context: context, initialTime: _time);
    if (time != null && mounted) {
      setState(() => _time = time);
    }
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: _selectTime,
      icon: const Icon(Icons.schedule),
      label: Text(_time.format(context)),
    );
  }
}
