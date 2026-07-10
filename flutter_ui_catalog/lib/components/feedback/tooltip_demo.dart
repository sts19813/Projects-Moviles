import 'package:flutter/material.dart';

class TooltipDemo extends StatelessWidget {
  const TooltipDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Tooltip(
      message: 'Actualiza el contenido',
      triggerMode: TooltipTriggerMode.tap,
      child: IconButton(onPressed: null, icon: Icon(Icons.refresh)),
    );
  }
}
