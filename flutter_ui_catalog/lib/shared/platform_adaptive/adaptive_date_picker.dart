import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveDatePicker extends StatelessWidget {
  const AdaptiveDatePicker({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final DateTime value;
  final ValueChanged<DateTime> onChanged;

  Future<void> _showPicker(BuildContext context) async {
    if (Platform.isIOS) {
      await showCupertinoModalPopup<void>(
        context: context,
        builder: (context) => SizedBox(
          height: 320,
          child: ColoredBox(
            color: CupertinoColors.systemBackground.resolveFrom(context),
            child: SafeArea(
              top: false,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: value,
                onDateTimeChanged: onChanged,
              ),
            ),
          ),
        ),
      );
      return;
    }
    final date = await showDatePicker(
      context: context,
      initialDate: value,
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );
    if (date != null) {
      onChanged(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () => _showPicker(context),
      icon: const Icon(Icons.calendar_today),
      label: Text('${value.day}/${value.month}/${value.year}'),
    );
  }
}
