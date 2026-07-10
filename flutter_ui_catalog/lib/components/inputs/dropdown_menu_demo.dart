import 'package:flutter/material.dart';

class DropdownMenuDemo extends StatefulWidget {
  const DropdownMenuDemo({super.key});

  @override
  State<DropdownMenuDemo> createState() => _DropdownMenuDemoState();
}

class _DropdownMenuDemoState extends State<DropdownMenuDemo> {
  String _selection = 'Flutter';

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: _selection,
      label: const Text('Tecnología'),
      onSelected: (value) {
        if (value != null) {
          setState(() => _selection = value);
        }
      },
      dropdownMenuEntries: const <DropdownMenuEntry<String>>[
        DropdownMenuEntry<String>(value: 'Flutter', label: 'Flutter'),
        DropdownMenuEntry<String>(value: 'Dart', label: 'Dart'),
        DropdownMenuEntry<String>(value: 'Firebase', label: 'Firebase'),
      ],
    );
  }
}
